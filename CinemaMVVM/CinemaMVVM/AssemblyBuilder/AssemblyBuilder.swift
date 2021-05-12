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

//MARK: Initialise elements in project
final class AssemblyBuilder: AssemblyBuilderProtocol {
    func createMainModule(coordinator: CoordinatorProtocol) -> UITableViewController {
        let view = MainTableVC()
        let mainViewModel = MainViewModel()
        view.viewModel = mainViewModel
        return view
    }
    
    func createDetailModule(cinema: CinemaModel, coordinator: CoordinatorProtocol) -> UIViewController {
        let view = DetailViewController()
        let detailViewModel = DetailViewModel()
        view.detailViewModel = detailViewModel
        return view
    }
}
