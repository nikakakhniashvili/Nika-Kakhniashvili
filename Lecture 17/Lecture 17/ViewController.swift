//
//  ViewController.swift
//  Lecture 17
//
//  Created by Nika Kakhniashvili on 15.04.24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        let backgroundImage = UIImageView(image: UIImage(named: "Background"))
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.frame = view.bounds
        view.addSubview(backgroundImage)
        view.sendSubviewToBack(backgroundImage)
        
        let label = UILabel()
        label.text = "შედი აპლიკაციაში და იწუწუნე რამდენიც გინდა"
        label.font = UIFont(name: "FiraGO-Regular", size: 28)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        ])
        
        let startButton = UIButton(type: .system)
        startButton.setTitle("დაწყება", for: .normal)
        startButton.titleLabel?.font = UIFont(name: "FiraGO-Regular", size: 18)
        startButton.backgroundColor = UIColor(red: 0.8, green: 0.9, blue: 1.0, alpha: 1.0)
        startButton.layer.cornerRadius = 25
        startButton.clipsToBounds = true
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        view.addSubview(startButton)
        
        startButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            startButton.widthAnchor.constraint(equalToConstant: 150),
            startButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func startButtonTapped() {
        let collectionViewController = CollectionViewController()
        collectionViewController.modalPresentationStyle = .fullScreen
        present(collectionViewController, animated: false, completion: nil)
    }

    }
