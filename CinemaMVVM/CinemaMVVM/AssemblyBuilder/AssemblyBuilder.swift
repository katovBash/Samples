//
//  AssemblyBuilder.swift
//  CinemaMVVM
//
//  Created by Nick Bashkatov on 11.05.2021.
//

import Foundation
import UIKit

protocol AssemblyBuilderProtocol {
    func createMainModule(coordinator: CoordinatorProtocol) -> UITableViewController
    func createDetailModule(cinema: CinemaModel, coordinator: CoordinatorProtocol) -> UIViewController
}

// MARK: Initialise elements in project

final class AssemblyBuilder: AssemblyBuilderProtocol {
    func createMainModule(coordinator: CoordinatorProtocol) -> UITableViewController {
        let mainView = MainTableVC()
        let networkService = NetworkService()
        let mainViewModel = MainViewModel(netWorkService: networkService, coordinator: coordinator)
        mainView.viewModel = mainViewModel
        mainView.coordinator = coordinator
        return mainView
    }

    func createDetailModule(cinema: CinemaModel, coordinator: CoordinatorProtocol) -> UIViewController {
        let detailView = DetailViewController()
        let networkService = NetworkService()
        let detailViewModel = DetailViewModel(networkService: networkService, coordinator: coordinator, model: cinema)
        detailView.detailViewModel = detailViewModel
        detailView.coordinator = coordinator
        return detailView
    }
}
