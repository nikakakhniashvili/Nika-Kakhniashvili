//
//  ViewController.swift
//  Lecture 14
//
//  Created by Nika Kakhniashvili on 08.04.24.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "lock.laptopcomputer"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .black
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        
//        MARK: - Stackview for titleLabel and descriptionLabel
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 14
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let titleLabel = UILabel()
        titleLabel.text = "მოგესალმებით!"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 25)
        titleLabel.textAlignment = .left
        
        let descriptionLabel = UILabel()
        descriptionLabel.text = "ამ აპლიკაციის გამოყენების საუკეთესო გზა თქვენს ანგარიშზე შესვლაა, თუ არ გაქვთ ანგარიში გააკეთეთ, თუ არ გსურთ გაკეთება დასტოვეთ აქაურობა და წაშალეთ აპლიკაცია."
        descriptionLabel.font = UIFont.systemFont(ofSize: 16)
        descriptionLabel.textAlignment = .left
        descriptionLabel.numberOfLines = 0
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        
        view.addSubview(stackView)
        
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
//        MARK: - Constraints for loginLabel
        
        let loginLabel = UILabel()
        loginLabel.text = "ავტორიზაცია"
        loginLabel.font = UIFont(name: "Arial", size: 22)
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginLabel)
        loginLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 17).isActive = true
        loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
//        MARK: - Blue line
        
        let lineView = UIView()
        lineView.backgroundColor = UIColor.systemBlue
        lineView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lineView)
        
        lineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        lineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        lineView.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 15).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 3).isActive = true
        
//        MARK: - Stackview for fields
        
        let stackView2 = UIStackView()
        stackView2.axis = .vertical
        stackView2.spacing = 20
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        
        let field1Label = UILabel()
        field1Label.text = "სრული სახელი"
        field1Label.font = UIFont(name: "Arial", size: 14)
        field1Label.textAlignment = .left
        
        let field2Label = UILabel()
        field2Label.text = "ელ.ფოსტა"
        field2Label.font = UIFont(name: "Arial", size: 14)
        field2Label.textAlignment = .left
        
        let field3Label = UILabel()
        field3Label.text = "პაროლი"
        field3Label.font = UIFont(name: "Arial", size: 14)
        field3Label.textAlignment = .left
        
        let field1TextField = UITextField()
        field1TextField.placeholder = "მაგ: ქეთინო ფერი"
        field1TextField.borderStyle = .roundedRect
        
        let field2TextField = UITextField()
        field2TextField.placeholder = "მაგ: kusuna@mail.ru"
        field2TextField.borderStyle = .roundedRect
        
        let field3TextField = UITextField()
        field3TextField.placeholder = "მაგ: busuna123, jajanaIsMyKumiri2010"
        field3TextField.borderStyle = .roundedRect
        field3TextField.isSecureTextEntry = true
        
        let loginButton = UIButton(type: .system)
        loginButton.setTitle("შესვლა", for: .normal)
        loginButton.backgroundColor = .systemBlue
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = 8
        
        stackView2.addArrangedSubview(field1Label)
        stackView2.addArrangedSubview(field1TextField)
        stackView2.addArrangedSubview(field2Label)
        stackView2.addArrangedSubview(field2TextField)
        stackView2.addArrangedSubview(field3Label)
        stackView2.addArrangedSubview(field3TextField)
        stackView2.addArrangedSubview(loginButton)
        
        view.addSubview(stackView2)
        
        stackView2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        stackView2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        stackView2.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 32).isActive = true
        
//        MARK: - Stackview for gray line
        
        let stackView3 = UIStackView()
        stackView3.axis = .horizontal
        stackView3.spacing = 5
        stackView3.translatesAutoresizingMaskIntoConstraints = false
        
        let grayLine1View = UIView()
        grayLine1View.backgroundColor = UIColor.gray
        grayLine1View.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(grayLine1View)
        
        let grayLine2View = UIView()
        grayLine2View.backgroundColor = UIColor.gray
        grayLine2View.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(grayLine2View)
        
        let orLabel = UILabel()
        orLabel.text = "ან"
        orLabel.font = UIFont(name: "Arial", size: 15)
        orLabel.textAlignment = .center
        
        stackView3.addArrangedSubview(grayLine1View)
        stackView3.addArrangedSubview(orLabel)
        stackView3.addArrangedSubview(grayLine2View)
        
        view.addSubview(stackView3)
        
        stackView3.topAnchor.constraint(equalTo: stackView2.bottomAnchor, constant: 22).isActive = true
        stackView3.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        let lineHeight: CGFloat = 2
        grayLine1View.heightAnchor.constraint(equalToConstant: lineHeight).isActive = true
        grayLine2View.heightAnchor.constraint(equalToConstant: lineHeight).isActive = true
        grayLine1View.widthAnchor.constraint(equalToConstant: 160).isActive = true
        grayLine2View.widthAnchor.constraint(equalToConstant: 160).isActive = true
        
        stackView3.alignment = .center
        
//        MARK: - Stackview for login buttons
        
        let stackView4 = UIStackView()
        stackView4.axis = .vertical
        stackView4.spacing = 10
        stackView4.translatesAutoresizingMaskIntoConstraints = false
        
        let symbol1 = "\u{24BC}"
        let symbol2 = "\u{24BB}"
        
        let googleButton = UIButton(type: .system)
        googleButton.setTitle("\(symbol1) გამოიყენეთ გუგლი", for: .normal)
        googleButton.backgroundColor = .lightGray
        googleButton.setTitleColor(.black, for: .normal)
        googleButton.layer.cornerRadius = 8
        
        let facebookButton = UIButton(type: .system)
        facebookButton.setTitle("\(symbol2) გამოიყენეთ ფეიზბურგი", for: .normal)
        facebookButton.backgroundColor = .lightGray
        facebookButton.setTitleColor(.black, for: .normal)
        facebookButton.layer.cornerRadius = 8
        
        stackView4.addArrangedSubview(googleButton)
        stackView4.addArrangedSubview(facebookButton)
        
        view.addSubview(stackView4)
        
        stackView4.topAnchor.constraint(equalTo: stackView3.bottomAnchor, constant: 16).isActive = true
        stackView4.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView4.widthAnchor.constraint(equalToConstant: 260).isActive = true
    }
    
    private func setupUI() {
        view.addSubview(imageView)
        
        imageView.widthAnchor.constraint(equalToConstant: 90).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 52).isActive = true
    }
}

