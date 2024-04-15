//
//  SceneDelegate.swift
//  Lecture 17
//
//  Created by Nika Kakhniashvili on 15.04.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = scene as? UIWindowScene else { return }
        window = UIWindow(windowScene: windowScene)
        
        
        let launchScreenViewController = LaunchScreenViewController()
        window?.rootViewController = launchScreenViewController
        window?.makeKeyAndVisible()
        
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            let navigationController = UINavigationController(rootViewController: ViewController())
            self.window?.rootViewController = navigationController
        }
    }
}


