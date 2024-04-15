//
//  LaunchScreen1.swift
//  Lecture 17
//
//  Created by Nika Kakhniashvili on 15.04.24.
//

import UIKit

class LaunchScreenViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add background photo
        let backgroundImageView = UIImageView(image: UIImage(named: "BlueRectangle"))
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.frame = view.bounds
        view.addSubview(backgroundImageView)
        
        // Add label
        let label = UILabel()
        label.text = "წუწუნი Hub"
        label.font = UIFont(name: "FiraGO-Regular", size: 24)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        // Center the label
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        // Delay transition to main interface by 1.5 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.transitionToMainScreen()
        }
    }
    
    func transitionToMainScreen() {
        // Replace "MainViewController" with the name of your actual main view controller class
        let mainViewController = ViewController()
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let sceneDelegate = windowScene.delegate as? SceneDelegate {
            // Use the scene delegate's window to set the root view controller
            sceneDelegate.window?.rootViewController = mainViewController
            sceneDelegate.window?.makeKeyAndVisible()
        }
    }
}
