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
    var navigationController: UINavigationController { get set }
    
    func startMain()
    func startDetail(model: CinemaModel)
}

class MainCoordinator: NSObject, CoordinatorProtocol {
    var childCoordinator: [CoordinatorProtocol] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func startMain() {
        let mainVC = MainTableVC()
        mainVC.coordinator = self
        navigationController.pushViewController(mainVC, animated: true)
    }
    
    func startDetail(model: CinemaModel) {
        let detailVC = DetailViewController()
        detailVC.coordinator = self
        detailVC.cinemaModel = model
        navigationController.pushViewController(detailVC, animated: true)
    }
}

