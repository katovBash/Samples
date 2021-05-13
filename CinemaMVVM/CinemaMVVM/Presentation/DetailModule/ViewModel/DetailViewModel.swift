//
//  DetailViewModel.swift
//  CinemaMVVM
//
//  Created by Nick Bashkatov on 11.05.2021.
//

import Foundation

protocol DetailViewModelProtocol: AnyObject {
    var updateViewData: (() -> ())? { get set }
    var cinemaModel: CinemaListImageModel? { get set }
    func getCinema(movieID: Int)
}

final class DetailViewModel: DetailViewModelProtocol {
    var updateViewData: (() -> ())?

    var cinemaModel: CinemaListImageModel?
    private var networkService = NetworkService()

    func getCinema(movieID: Int) {
        networkService.getListImageList(movieID: movieID) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case let .success(films):
                    self.cinemaModel = films
                    self.updateViewData?()
                case let .failure(error):
                    print(error)
                }
            }
        }
    }
}
