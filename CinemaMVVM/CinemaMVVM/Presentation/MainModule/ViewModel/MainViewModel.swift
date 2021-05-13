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
}

final class MainViewModel: MainViewModelProtocol {
    
    var updateViewData: (() -> ())?
    private var networkService = NetworkService()
    var cinemaModelList: CinemaListModel?
    var cinemaModel: CinemaModel?
    var coreDataProvider = CoreDataProvider()
    var container: NSPersistentContainer? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    
    func getCinema() {
        networkService.getListFilms { [weak self] result in
            guard let self = self else {return}
            DispatchQueue.main.async {
                switch result {
                case let .success(films):
                    self.cinemaModelList = films
                    guard let filmsArray = films.results else {return}
                    self.coreDataProvider.saveData(movie: filmsArray)
                    self.updateViewData?()
                case let .failure(error):
                    print(error)
                }
            }
        }
    }
}

