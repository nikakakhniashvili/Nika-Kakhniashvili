//
//  ViewController.swift
//  Lecture 13
//
//  Created by Nika Kakhniashvili on 05.04.24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myView1: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myView1.layer.cornerRadius = 12
    }
}

