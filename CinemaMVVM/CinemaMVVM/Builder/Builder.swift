//
//  AssemblyBuilder.swift
//  CinemaMVVM
//
//  Created by Nick Bashkatov on 11.05.2021.
//

import Foundation
import UIKit

protocol BuilderProtocol {
    func createMainModule(coordinator: CoordinatorProtocol) -> UITableViewController
    func createDetailModule(cinema: CinemaListEntity, coordinator: CoordinatorProtocol) -> UIViewController
}

// MARK: Initialise elements in project

final class Builder: BuilderProtocol {
    func createMainModule(coordinator: CoordinatorProtocol) -> UITableViewController {
        let mainView = MainTableVC()
        let networkService = NetworkService()

        let mainViewModel = MainViewModel(netWorkService: networkService, coordinator: coordinator)
        mainView.viewModel = mainViewModel
        mainViewModel.coordinator = coordinator
        return mainView
    }

    func createDetailModule(cinema: CinemaListEntity, coordinator: CoordinatorProtocol) -> UIViewController {
        let detailView = DetailViewController()
        let networkService = NetworkService()

        let detailViewModel = DetailViewModel(networkService: networkService, coordinator: coordinator, model: cinema)
        detailView.detailViewModel = detailViewModel
        detailViewModel.coordinator = coordinator
        return detailView
    }
}
