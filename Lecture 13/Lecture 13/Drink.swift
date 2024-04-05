//
//  Drink.swift
//  Lecture 13
//
//  Created by Nika Kakhniashvili on 06.04.24.
//

import Foundation

struct Drink {
    let productName: String
    let productName2: String
    let rating: String
    let reviews: String
    let descriptionTitle: String
    let description: String
    let sizeTitle: String
    let sizeOption1: String
    let sizeOption2: String
    let sizeOption3: String
    let priceTitle: String
    let price: Double
    let buyingOption: String
}

let mangoDrink = Drink(productName: "მანგოს სმუზი",
                       productName2: "ქოქოსის რძით",
                       rating: "⭐️4.8",
                       reviews: " (230)",
                       descriptionTitle: "აღწერა",
                       description: "აღნიშნული პროდუქტი შეიცავს: ქოქოსის რძეს, მანგოს პიურეს, ჯანჯაფილს, ქოქოსის ფანტელს...",
                       sizeTitle: "ზომა",
                       sizeOption1: "პატარა",
                       sizeOption2: "საშუალო",
                       sizeOption3: "დიდი",
                       priceTitle: "ფასი",
                       price: 6.00,
                       buyingOption: "ყიდვა")
