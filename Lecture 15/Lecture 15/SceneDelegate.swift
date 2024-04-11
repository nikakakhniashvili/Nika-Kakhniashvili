//
//  SceneDelegate.swift
//  Lecture 15
//
//  Created by Nika Kakhniashvili on 11.04.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = scene as? UIWindowScene else { return }
        window = UIWindow(windowScene: scene)
        let navigateController = UINavigationController(rootViewController: ViewController())
        window?.rootViewController = navigateController
        window?.makeKeyAndVisible()
    }
    
}


