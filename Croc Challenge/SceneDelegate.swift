//
//  SceneDelegate.swift
//  Croc Challenge
//
//  Created by Yelena Gorelova on 17.04.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        let viewController = MainViewController()
        let categoryVC = CategoryViewController()
        let resultVC = GameResultViewController()
        let navController = UINavigationController(rootViewController: resultVC)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
}

