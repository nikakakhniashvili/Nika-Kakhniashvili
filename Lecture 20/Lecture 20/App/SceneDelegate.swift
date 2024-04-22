//
//  SceneDelegate.swift
//  Lecture 20
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = scene as? UIWindowScene else { return }
        window = UIWindow(windowScene: scene)
        
        // Create an instance of UINavigationController with your root view controller
        let navigationController = UINavigationController(rootViewController: ViewController())
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
}



