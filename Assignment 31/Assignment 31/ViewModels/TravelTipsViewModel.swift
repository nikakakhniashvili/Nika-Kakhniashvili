//
//  TravelTipsViewModel.swift
//  Assignment 31
//
//  Created by Nika Kakhniashvili on 30.05.24.
//

import Foundation

class TravelTipsViewModel: ObservableObject {
    @Published var travelTips: [TravelTip] = [
        TravelTip(tip: "Pack light and bring versatile clothing."),
        TravelTip(tip: "Always have a backup of important documents."),
        // Add other tips
    ]
    
    func getRandomTip() -> String {
        travelTips.randomElement()?.tip ?? "Enjoy your trip!"
    }
}

