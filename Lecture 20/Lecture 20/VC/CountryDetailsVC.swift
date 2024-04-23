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
    var aboutFlagLabel: UILabel!
    var flagInfoLabel: UILabel!
    var grayLineView: UIView!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupFlag()
        setupFlagInfo()
        
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
        
        // Apply drop shadow to the container view
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
        
        // Add label for "About the flag"
        aboutFlagLabel = UILabel()
        aboutFlagLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutFlagLabel.text = "About the flag:"
        aboutFlagLabel.font = UIFont.boldSystemFont(ofSize: 16)
        view.addSubview(aboutFlagLabel)
        
        // Add constraints for "About the flag" label
        NSLayoutConstraint.activate([
            aboutFlagLabel.topAnchor.constraint(equalTo: flagContainerView.bottomAnchor, constant: 20),
            aboutFlagLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        // Add label for flag information
        flagInfoLabel = UILabel()
        flagInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        flagInfoLabel.numberOfLines = 0 // Allow multiple lines
        view.addSubview(flagInfoLabel)
        
        // Add constraints for flag information label
        NSLayoutConstraint.activate([
            flagInfoLabel.topAnchor.constraint(equalTo: aboutFlagLabel.bottomAnchor, constant: 10),
            flagInfoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            flagInfoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        // Add gray line below flag information
        grayLineView = UIView()
        grayLineView.translatesAutoresizingMaskIntoConstraints = false
        grayLineView.backgroundColor = .lightGray
        view.addSubview(grayLineView)
        
        // Add constraints for gray line view
        NSLayoutConstraint.activate([
            grayLineView.topAnchor.constraint(equalTo: flagInfoLabel.bottomAnchor, constant: 10),
            grayLineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            grayLineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            grayLineView.heightAnchor.constraint(equalToConstant: 1)
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
    
    func setupFlagInfo() {
        // Set flag information text
        flagInfoLabel.text = country?.flags.alt
    }
    
}

