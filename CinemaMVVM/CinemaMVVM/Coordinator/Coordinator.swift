//
//  Coordinator.swift
//  CinemaMVVM
//
//  Created by Nick Bashkatov on 11.05.2021.
//

import Foundation
import UIKit

protocol CoordinatorProtocol: AnyObject {
    var childCoordinator: [CoordinatorProtocol] { get set }
    var navigationController: UINavigationController? { get set }

    func startMain()
    func startDetail(model: CinemaModel)
}

final class Coordinator: NSObject, CoordinatorProtocol {
    var childCoordinator: [CoordinatorProtocol] = []
    var navigationController: UINavigationController?
    var assemblyBuilder: AssemblyBuilder?

    init(navigationController: UINavigationController, assemblyBuilder: AssemblyBuilder) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }

    func startMain() {
        if let navigationController = navigationController {
            guard let mainVC = assemblyBuilder?.createMainModule(coordinator: self) else { return }
            navigationController.viewControllers = [mainVC]
        }
    }

    func startDetail(model: CinemaModel) {
        if let navigationController = navigationController {
            guard let detailVC = assemblyBuilder?.createDetailModule(cinema: model, coordinator: self) else { return }
            navigationController.pushViewController(detailVC, animated: true)
        }
    }
}
