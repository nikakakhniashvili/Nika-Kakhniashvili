//
//  ViewCollection.swift
//  Lecture 17
//
//  Created by Nika Kakhniashvili on 15.04.24.
//

import UIKit


class CollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIAdaptivePresentationControllerDelegate, NewCardDelegate {
   
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 4
        layout.minimumLineSpacing = 8
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "CustomCell")
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    var icons = ["Icon1", "Icon2", "Icon3", "Icon4"]
    var boldTexts = ["Bold Text 1", "Bold Text 2", "Bold Text 3", "Bold Text 4"]
    var regularTexts = ["Regular Text 1", "Regular Text 2", "Regular Text 3", "Regular Text 4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        
        let backgroundImage = UIImageView(image: UIImage(named: "BlueRectangle"))
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundImage)
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        setupCollectionView()
    
        
        let button = UIButton(type: .system)
        button.setTitle("Go to New Card", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.backgroundColor = UIColor(red: 0.8, green: 0.9, blue: 1.0, alpha: 1.0)
        button.layer.cornerRadius = 25
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(goToNewCard), for: .touchUpInside)
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 140),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        modalPresentationStyle = .overFullScreen
        isModalInPresentation = true
        presentationController?.delegate = self
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            collectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6)
        ])
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return icons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCollectionViewCell
        cell.backgroundColor = .gray // Set cell background color to gray
        cell.iconImageView.image = UIImage(named: icons[indexPath.item])
        cell.boldLabel.text = boldTexts[indexPath.item]
        cell.regularLabel.text = regularTexts[indexPath.item]
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 8) / 2
        return CGSize(width: width, height: width)
    }
    
    func didSelectNewCard(icon: UIImage?, labelText1: String?, labelText2: String?) {
            guard let icon = icon else { return }
            
            if let imageData = icon.pngData() {

                UserDefaults.standard.set(imageData, forKey: "selectedIcon")
            }
            
            let boldText = labelText1 ?? ""
            let regularText = labelText2 ?? ""
            
           
            icons.append("Custom Icon")
            boldTexts.append(boldText)
            regularTexts.append(regularText)
           
            collectionView.reloadData()
        }

    
    
    // MARK: - Actions
    
    @objc func goToNewCard() {
        let newCardViewController = NewCardViewController()
        newCardViewController.delegate = self
        present(newCardViewController, animated: true, completion: nil)
    }


}
