//
//  DetailViewModel.swift
//  CinemaMVVM
//
//  Created by Nick Bashkatov on 11.05.2021.
//

import Foundation

protocol DetailViewModelProtocol: AnyObject {
    var updateViewData: (() -> ())? { get set }
    var cinemaModel: CinemaListEntity? { get set }
    var coordinator: CoordinatorProtocol? { get set }
    init(networkService: NetworkServiceProtocol, coordinator: CoordinatorProtocol, model: CinemaListEntity?)
    func getCinema(movieID: Int)
}

final class DetailViewModel: DetailViewModelProtocol {
    var updateViewData: (() -> ())?
    var cinemaModel: CinemaListEntity?
    var cinemaModelList: CinemaImageEntity?
    var coordinator: CoordinatorProtocol?
    private var networkService: NetworkServiceProtocol?

    required init(networkService: NetworkServiceProtocol, coordinator: CoordinatorProtocol, model: CinemaListEntity?) {
        self.networkService = networkService
        self.coordinator = coordinator
        cinemaModel = model
    }

    func getCinema(movieID: Int) {
        networkService?.getListImageList(movieID: movieID) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case let .success(films):
                    self.cinemaModelList = films
                    self.updateViewData?()
                case let .failure(error):
                    print(error)
                }
            }
        }
    }
}
