//
//  AddButton.swift
//  Lecture 17
//
//  Created by Nika Kakhniashvili on 15.04.24.
//

import UIKit

class AddButton {
    
    static func handleButtonTap(icon: String, labelText1: String, labelText2: String, collectionViewController: CollectionViewController) {
        
        collectionViewController.icons.append(icon)
        collectionViewController.boldTexts.append(labelText1)
        collectionViewController.regularTexts.append(labelText2)
        
        collectionViewController.collectionView.reloadData()
    }
}

