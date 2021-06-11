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
    func startDetail(model: CinemaListEntity)
}

final class Coordinator: CoordinatorProtocol {
    var childCoordinator: [CoordinatorProtocol] = []
    var navigationController: UINavigationController?
    var assemblyBuilder: Builder?

    init(navigationController: UINavigationController, assemblyBuilder: Builder) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }

    func startMain() {
        if let navigationController = navigationController {
            guard let mainVC = assemblyBuilder?.createMainModule(coordinator: self) else { return }
            navigationController.viewControllers = [mainVC]
        }
    }

    func startDetail(model: CinemaListEntity) {
        if let navigationController = navigationController {
            guard let detailVC = assemblyBuilder?.createDetailModule(cinema: model, coordinator: self) else { return }
            navigationController.pushViewController(detailVC, animated: true)
        }
    }
}
