//
//  SceneDelegate.swift
//  PokemonApp
//
//  Created by Diego Costa on 10/01/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        let homeViewController = HomeListViewController()
        
        window = .init(windowScene: scene)
        window?.rootViewController = AppNavigationController(rootViewController: homeViewController)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
    }
}

