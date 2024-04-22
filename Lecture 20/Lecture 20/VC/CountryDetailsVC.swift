//
//  DetailViewController.swift
//  Lecture 20
//

import UIKit

class CountryDetailViewController: UIViewController {
    
    // MARK: - Properties
    var country: Country?
    var flagContainerView: UIView!
    var flagImageView: UIImageView!
    var contentView: UIView!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupFlag()
        
        // Set the navigation title to the country name
        navigationItem.title = country?.name.common
    }
    
    // MARK: - Setup Methods
    func setupViews() {
        // Set white background
        view.backgroundColor = .white
        
        // Add container view for flag image
        flagContainerView = UIView()
        flagContainerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(flagContainerView)
        
        // Add constraints for container view
        NSLayoutConstraint.activate([
            flagContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            flagContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            flagContainerView.widthAnchor.constraint(equalToConstant: 300),
            flagContainerView.heightAnchor.constraint(equalToConstant: 190)
        ])
        
        // Apply dropshadow to the container view
        flagContainerView.layer.shadowColor = UIColor.black.cgColor
        flagContainerView.layer.shadowOpacity = 0.5
        flagContainerView.layer.shadowRadius = 5
        flagContainerView.layer.shadowOffset = CGSize(width: 0, height: 4)
        flagContainerView.layer.masksToBounds = false
        
        // Add flag image view inside the container view
        flagImageView = UIImageView()
        flagImageView.translatesAutoresizingMaskIntoConstraints = false
        flagImageView.contentMode = .scaleAspectFill
        flagImageView.clipsToBounds = true
        flagImageView.layer.cornerRadius = 18
        flagImageView.layer.masksToBounds = true
        flagContainerView.addSubview(flagImageView)
        
        // Add constraints for flag image view
        NSLayoutConstraint.activate([
            flagImageView.topAnchor.constraint(equalTo: flagContainerView.topAnchor),
            flagImageView.leadingAnchor.constraint(equalTo: flagContainerView.leadingAnchor),
            flagImageView.trailingAnchor.constraint(equalTo: flagContainerView.trailingAnchor),
            flagImageView.bottomAnchor.constraint(equalTo: flagContainerView.bottomAnchor)
        ])
    }
    
    func setupFlag() {
        guard let country = country else {
            return
        }
        
        // Load the flag image and set it to the image view
        let flagURLString = country.flags.png
        if !flagURLString.isEmpty, let flagURL = URL(string: flagURLString) {
            DispatchQueue.global().async {
                if let imageData = try? Data(contentsOf: flagURL) {
                    DispatchQueue.main.async {
                        // Update UI on the main thread
                        self.flagImageView.image = UIImage(data: imageData)
                    }
                } else {
                    print("Error: Failed to load flag image data.")
                }
            }
        } else {
            print("Error: Invalid flag URL.")
        }
    }
    
}
