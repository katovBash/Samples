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
        let mainViewModel = MainViewModel()
        mainView.viewModel = mainViewModel
        return mainView
    }

    func createDetailModule(cinema: CinemaModel, coordinator: CoordinatorProtocol) -> UIViewController {
        let detailView = DetailViewController()
        let detailViewModel = DetailViewModel()
        detailView.detailViewModel = detailViewModel
        return detailView
    }
}
