//
//  ViewController3.swift
//  Lecture 15
//
//  Created by Nika Kakhniashvili on 11.04.24.
//

import UIKit

class ViewController3: UIViewController {
    
    let spaceImage = UIImageView()
    let imageView = UIImageView()
    let titleLabel = UILabel()
    var zodiacSign: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSpaceImage()
        addView()
        updateContent()
    }
    
    func addSpaceImage() {
        spaceImage.frame = view.bounds
        spaceImage.contentMode = .scaleAspectFill
        spaceImage.clipsToBounds = true
        spaceImage.image = UIImage(named: "spaceImage")
        view.addSubview(spaceImage)
    }
    
    func addView() {
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        titleLabel.font = UIFont.systemFont(ofSize: 24)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func updateContent() {
        guard let zodiacSignName = zodiacSign else {
            return
        }
        
        if let selectedZodiacSign = zodiacSigns.first(where: { (zodiac) -> Bool in
            return zodiac.name == zodiacSignName
        }) {
            imageView.image = UIImage(named: selectedZodiacSign.polarImageName)
            titleLabel.text = selectedZodiacSign.polarName
        }
    }
    
}
