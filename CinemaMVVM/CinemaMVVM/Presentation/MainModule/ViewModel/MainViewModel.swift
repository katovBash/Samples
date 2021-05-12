//
//  MainViewModel.swift
//  CinemaMVVM
//
//  Created by Nick Bashkatov on 11.05.2021.
//

import Foundation
import CoreData
import UIKit

protocol MainViewModelProtocol: AnyObject {
    var cinemaModelList: CinemaListModel? {get set}
    var updateViewData: (() -> ())? {get set}
    func getCinema()
    func loadView()
}

final class MainViewModel: MainViewModelProtocol {
    
    var updateViewData: (() -> ())?
    private var networkService = NetworkService()
    var cinemaModelList: CinemaListModel?
    var cinemaModel: CinemaModel?
    var coreDataProvider = CoreDataProvider()
    var container: NSPersistentContainer? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    
    func getCinema() {
        networkService.getListFilms({ [weak self] result in
            guard let self = self else {return}
            DispatchQueue.main.async {
                switch result {
                case let .success(films):
                    self.cinemaModelList = films
                    self.updateViewData?()
                    guard let filmsArray = films.results else {return}
                    self.coreDataProvider.saveData(movie: filmsArray)
                case let .failure(error):
                    print(error)
                }
            }
        })
    }
    
    func getInfoCoreData() {
        if let context = self.container?.viewContext {
            let request: NSFetchRequest<MovieCoreData> = MovieCoreData.fetchRequest()
            request.sortDescriptors = [NSSortDescriptor(key: #keyPath(MovieCoreData.rate), ascending: false)]
            let data = try? context.fetch(request)
            let result = data?.compactMap { movie -> CinemaModel in
                let movieEntity = CinemaModel(posterPath: movie.posterImage ?? String(),
                                              originalTitle: movie.title ?? String(),
                                              overview: movie.overView ?? String(),
                                              voteAverage: movie.rate)
                return movieEntity
            }
            cinemaModelList?.results = result ?? []
        }
    }
    
    func loadView() {
        if cinemaModelList?.results?.count == 0 {
            getCinema()
        } else {
            getInfoCoreData()
        }
    }
}

