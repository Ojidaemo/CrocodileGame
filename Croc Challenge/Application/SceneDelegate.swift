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
        
        let mainVC = MainViewController()
//        let categoryVC = CategoryViewController()
//        let resultVC = GameResultViewController()
//        let teamViewController = TeamViewController()
//        let roolsViewController = RulesViewController()
        let navController = NavController(rootViewController: mainVC)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
}

