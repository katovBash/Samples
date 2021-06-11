//
//  MainViewModel.swift
//  CinemaMVVM
//
//  Created by Nick Bashkatov on 11.05.2021.
//

import CoreData
import Foundation
import UIKit

protocol MainViewModelProtocol: AnyObject {
    var coordinator: CoordinatorProtocol? { get set }
    var cinemaModelList: CinemaEntity? { get set }
    var updateViewData: (() -> ())? { get set }
    init(netWorkService: NetworkServiceProtocol, coordinator: CoordinatorProtocol)
    func getCinema()
}

final class MainViewModel: MainViewModelProtocol {
    private var networkService: NetworkServiceProtocol?
    private var coreDataProvider = CoreDataService()
    var coordinator: CoordinatorProtocol?
    var cinemaModelList: CinemaEntity?
    var cinemaModel: CinemaListEntity?
    var updateViewData: (() -> ())?

    required init(netWorkService: NetworkServiceProtocol, coordinator: CoordinatorProtocol) {
        networkService = netWorkService
        self.coordinator = coordinator
    }

    func getCinema() {
        networkService?.getListFilms { [weak self] result in
            guard let self = self else { return }

            DispatchQueue.main.async {
                switch result {
                case let .success(films):
                    self.cinemaModelList = films
                    guard let filmsArray = films.results else { return }
                    self.coreDataProvider.saveData(movie: filmsArray)
                    self.updateViewData?()

                case let .failure(error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
