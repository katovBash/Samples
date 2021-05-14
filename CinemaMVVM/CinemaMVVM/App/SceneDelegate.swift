//
//  SceneDelegate.swift
//  CinemaMVVM
//
//  Created by Nick Bashkatov on 11.05.2021.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var coordinator: CoordinatorProtocol?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene

        let navigationVC = UINavigationController()
        let assemblyBuilder = Builder()
        coordinator = Coordinator(navigationController: navigationVC, assemblyBuilder: assemblyBuilder)
        coordinator?.startMain()

        window?.rootViewController = navigationVC
        window?.makeKeyAndVisible()
    }
}
