//
//  SceneDelegate.swift
//  Lecture 16
//
//  Created by Nika Kakhniashvili on 13.04.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = scene as? UIWindowScene else { return }
        window = UIWindow(windowScene: windowScene)
        
        let contactsViewController = ContactsViewController()
        let navigationController = UINavigationController(rootViewController: contactsViewController)
        window?.rootViewController = navigationController
        
        window?.makeKeyAndVisible()
    }
}



