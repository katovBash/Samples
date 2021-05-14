//
//  DetailViewModel.swift
//  CinemaMVVM
//
//  Created by Nick Bashkatov on 11.05.2021.
//

import Foundation

protocol DetailViewModelProtocol: AnyObject {
    var updateViewData: (() -> ())? { get set }
    var cinemaModel: CinemaModel? { get set }
    func getCinema(movieID: Int)
}

final class DetailViewModel: DetailViewModelProtocol {
    var updateViewData: (() -> ())?
    var cinemaModel: CinemaModel?
    var cinemaModelList: CinemaListImageModel?
    private var networkService: NetworkServiceProtocol?
    private var coordinator: CoordinatorProtocol?

    required init(networkService: NetworkServiceProtocol, coordinator: CoordinatorProtocol, model: CinemaModel?) {
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
