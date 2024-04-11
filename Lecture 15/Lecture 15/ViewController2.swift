//
//  ViewController2.swift
//  Lecture 15
//
//  Created by Nika Kakhniashvili on 11.04.24.
//

import UIKit

class ViewController2: UIViewController {
    
    let spaceImage = UIImageView()
    var zodiacSign: String?
    let imageView = UIImageView()
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let polarButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSpaceImage()
        addViews()
        updateContent()
        addPolarButton()
    }
    
    func addSpaceImage() {
        spaceImage.frame = view.bounds
        spaceImage.contentMode = .scaleAspectFill
        spaceImage.clipsToBounds = true
        spaceImage.image = UIImage(named: "spaceImage")
        view.addSubview(spaceImage)
    }
    
    func addViews() {
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        titleLabel.font = UIFont.systemFont(ofSize: 24)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 40).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        descriptionLabel.font = UIFont.systemFont(ofSize: 16)
        descriptionLabel.textColor = .white
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionLabel)
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
    
    func updateContent() {
        guard let zodiacSignName = zodiacSign else {
            return
        }
        
        if let selectedZodiacSign = zodiacSigns.first(where: { (zodiac) -> Bool in
            return zodiac.name == zodiacSignName
        }) {
            imageView.image = UIImage(named: selectedZodiacSign.imageName)
            titleLabel.text = selectedZodiacSign.name
            descriptionLabel.text = selectedZodiacSign.description
        }
    }
    
    func addPolarButton() {
        polarButton.setTitle("პოლარული ნიშანი", for: .normal)
        polarButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        polarButton.setTitleColor(.white, for: .normal)
        polarButton.backgroundColor = UIColor.purple
        polarButton.layer.cornerRadius = 6
        polarButton.clipsToBounds = true
        
        polarButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(polarButton)
        
        polarButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        polarButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        polarButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        polarButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        polarButton.addTarget(self, action: #selector(navigateToViewController3), for: .touchUpInside)
    }
    
    @objc func navigateToViewController3() {
        guard let zodiacSign = zodiacSign
        else {return}
        let viewController3 = ViewController3()
        viewController3.zodiacSign = zodiacSign
        
        navigationController?.pushViewController(viewController3, animated: true)
    }
    
}


