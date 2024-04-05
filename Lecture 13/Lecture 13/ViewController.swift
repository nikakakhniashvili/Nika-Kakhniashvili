//
//  ViewController.swift
//  Lecture 13
//
//  Created by Nika Kakhniashvili on 05.04.24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productName2Label: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var reviewsLabel: UILabel!
    @IBOutlet weak var descriptionTitleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var sizeTitleLabel: UILabel!
    @IBOutlet weak var sizeOption1Button: UIButton!
    @IBOutlet weak var sizeOption2Button: UIButton!
    @IBOutlet weak var sizeOption3Button: UIButton!
    @IBOutlet weak var priceTitleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var buyingOptionButton: UIButton!
    
    @IBOutlet weak var myView1: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myView1.layer.cornerRadius = 12
        
        productNameLabel.text = mangoDrink.productName
        productName2Label.text = mangoDrink.productName2
        ratingLabel.text = mangoDrink.rating
        reviewsLabel.text = mangoDrink.reviews
        descriptionTitleLabel.text = mangoDrink.descriptionTitle
        descriptionTextView.text = mangoDrink.description
        sizeTitleLabel.text = mangoDrink.sizeTitle
        sizeOption1Button.setTitle(mangoDrink.sizeOption1, for: .normal)
        sizeOption2Button.setTitle(mangoDrink.sizeOption2, for: .normal)
        sizeOption3Button.setTitle(mangoDrink.sizeOption3, for: .normal)
        priceTitleLabel.text = mangoDrink.priceTitle
        priceLabel.text = "₾ \(mangoDrink.price)"
        buyingOptionButton.setTitle(mangoDrink.buyingOption, for: .normal)
    }
}


