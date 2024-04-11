//
//  ViewController.swift
//  Lecture 15
//
//  Created by Nika Kakhniashvili on 11.04.24.
//

import UIKit

class ViewController: UIViewController {
    
    let spaceImage = UIImageView()
    let stackView1 = UIStackView()
    let stackView2 = UIStackView()
    let nextButton = UIButton(type: .system)
    var zodiacInputTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSpaceImage()
        addStackView1()
        addStackView2()
        addNextButton()
    }
    
    func addSpaceImage() {
        spaceImage.frame = view.bounds
        spaceImage.contentMode = .scaleAspectFill
        spaceImage.clipsToBounds = true
        spaceImage.image = UIImage(named: "spaceImage")
        view.addSubview(spaceImage)
    }
    
    func addStackView1() {
        stackView1.axis = .vertical
        stackView1.spacing = 16
        stackView1.translatesAutoresizingMaskIntoConstraints = false
        
        let titleLabel = UILabel()
        titleLabel.text = "მიშა ცაგარელის ჰაბი"
        titleLabel.font = UIFont(name: "Arial", size: 24)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .left
        
        let descriptionLabel = UILabel()
        descriptionLabel.text = "მოცემულ აპლიკაციაში შეგიძლიათ გაიგოთ თქვენი ზოდიაქოს ყველაზე გამოკვეთილი უნარები და თვისებები."
        descriptionLabel.font = UIFont(name: "Arial", size: 16)
        descriptionLabel.textColor = .gray
        descriptionLabel.textAlignment = .left
        descriptionLabel.numberOfLines = 0
        
        stackView1.addArrangedSubview(titleLabel)
        stackView1.addArrangedSubview(descriptionLabel)
        
        view.addSubview(stackView1)
        
        stackView1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView1.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        stackView1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        stackView1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
    
    func addStackView2() {
        stackView2.axis = .vertical
        stackView2.spacing = 12
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        
        let zodiacNameLabel = UILabel()
        zodiacNameLabel.text = "ზოდიაქოს სახელი"
        zodiacNameLabel.font = UIFont(name: "Arial", size: 12)
        zodiacNameLabel.textColor = .white
        zodiacNameLabel.textAlignment = .left
        
        zodiacInputTextField = UITextField()
        zodiacInputTextField.textColor = .white
        let placeholder = NSAttributedString(string: "  მაგ: ტყუპები", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        zodiacInputTextField.attributedPlaceholder = placeholder
        zodiacInputTextField.widthAnchor.constraint(equalToConstant: 220).isActive = true
        zodiacInputTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        zodiacInputTextField.layer.cornerRadius = 6
        zodiacInputTextField.clipsToBounds = true
        zodiacInputTextField.layer.borderColor = UIColor.white.cgColor
        zodiacInputTextField.layer.borderWidth = 1
        zodiacInputTextField.translatesAutoresizingMaskIntoConstraints = false
        
        stackView2.addArrangedSubview(zodiacNameLabel)
        stackView2.addArrangedSubview(zodiacInputTextField)
        
        view.addSubview(stackView2)
        
        stackView2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView2.topAnchor.constraint(equalTo: stackView1.bottomAnchor, constant: 60).isActive = true
        stackView2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        stackView2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
    
    func addNextButton() {
        nextButton.setTitle("შემდეგ", for: .normal)
        nextButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.backgroundColor = UIColor.purple
        nextButton.layer.cornerRadius = 6
        nextButton.clipsToBounds = true
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(nextButton)
        
        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextButton.topAnchor.constraint(equalTo: stackView2.bottomAnchor, constant: 50).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        nextButton.addTarget(self, action: #selector(navigateToViewController2), for: .touchUpInside)
    }
    
    @objc func navigateToViewController2() {
        guard let zodiacSign = zodiacInputTextField.text
        else {return}
        let viewController2 = ViewController2()
        viewController2.zodiacSign = zodiacSign
        
        navigationController?.pushViewController(viewController2, animated: true)
    }
    
}
