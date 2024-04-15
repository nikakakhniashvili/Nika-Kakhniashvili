//
//  NewCardViewController.swift
//  Lecture 17
//
//  Created by Nika Kakhniashvili on 15.04.24.
//

import UIKit

protocol NewCardDelegate: AnyObject {
    func didSelectNewCard(icon: UIImage?, labelText1: String?, labelText2: String?)
}

class NewCardViewController: CollectionViewController {
    
    weak var collectionViewController: CollectionViewController?
    weak var delegate: NewCardDelegate?
    let textField1 = UITextField()
    let textField2 = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        let label1 = UILabel()
        label1.text = "Label 1"
        label1.textColor = .white
        
        let label2 = UILabel()
        label2.text = "Label 2"
        label2.textColor = .white
        
        textField1.backgroundColor = .white
        textField1.borderStyle = .roundedRect
        
       
        textField2.backgroundColor = .white
        textField2.borderStyle = .roundedRect
        
        let stackView = UIStackView(arrangedSubviews: [label1, textField1, label2, textField2])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        let iconNames = ["Icon1", "Icon2", "Icon3", "Icon4"]
        let iconStackView = UIStackView()
        iconStackView.axis = .horizontal
        iconStackView.spacing = 15
        iconStackView.alignment = .center
        iconStackView.distribution = .equalSpacing
        iconStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(iconStackView)

        for (index, iconName) in iconNames.enumerated() {
            let button = UIButton(type: .custom)
            let iconImage = UIImage(named: iconName)
            button.setImage(iconImage, for: .normal)
            button.imageView?.contentMode = .scaleAspectFit
            button.widthAnchor.constraint(equalToConstant: 50).isActive = true
            button.heightAnchor.constraint(equalToConstant: 50).isActive = true
            button.tag = index
            button.addTarget(self, action: #selector(iconButtonTapped(_:)), for: .touchUpInside)
            iconStackView.addArrangedSubview(button)
        }
        
        
        NSLayoutConstraint.activate([
            iconStackView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
            iconStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        
        let addButton = SwipeableButton(type: .system)
        addButton.setTitle("დამატება", for: .normal)
        addButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        addButton.backgroundColor = UIColor.green
        addButton.layer.cornerRadius = 25
        addButton.clipsToBounds = true
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        view.addSubview(addButton)
        
        
        addButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: iconStackView.bottomAnchor, constant: 20),
            addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            addButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
           swipeGesture.direction = .down
           view.addGestureRecognizer(swipeGesture)
    }
    
    @objc func handleSwipe() {
        
        print("Swipe gesture detected on the container view")
    }
    
    @objc func iconButtonTapped(_ sender: UIButton) {
        
        print("Icon button tapped")
    }
    
        var iconNames = ["Icon1", "Icon2", "Icon3", "Icon4"]
    
    @objc func addButtonTapped() {
        
        let selectedIconIndex = getSelectedIconIndex()
        let selectedIconName = iconNames[selectedIconIndex]
        
        
        let labelText1 = textField1.text ?? ""
        let labelText2 = textField2.text ?? ""
        
        
        AddButton.handleButtonTap(icon: selectedIconName, labelText1: labelText1, labelText2: labelText2, collectionViewController: self)
        
    }




    func getSelectedIconIndex() -> Int {
        return 0
    }

    // MARK: - NewCardDelegate
   

}

class SwipeableButton: UIButton {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        guard let touch = touches.first else { return }
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint) {
            print("Button tapped")
        } else {
            print("Swipe gesture detected")
        }
    }
}
