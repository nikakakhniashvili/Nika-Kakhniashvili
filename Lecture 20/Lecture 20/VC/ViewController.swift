//
//  ViewController.swift
//  Lecture 20
//
//  Created by Nika Kakhniashvili on 22.04.24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // MARK: - Properties
    
    var tableView: UITableView!
    var countries: [Country] = []
    let countryService = CountryService()
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        title = "Countries" // Set the navigation title
        fetchCountries() // Fetch country data
    }
    
    // MARK: - Setup Methods
    
    func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(tableView)
        
        // Set the header view
        let headerView = CustomHeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 40))
        tableView.tableHeaderView = headerView
        tableView.separatorStyle = .none
        tableView.rowHeight = 50
        tableView.estimatedRowHeight = 50
    }
    
    // MARK: - Data Methods
    
    func fetchCountries() {
        countryService.fetchCountries { [weak self] countries in
            if let countries = countries {
                self?.countries = countries
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            } else {
                print("Error fetching country data")
            }
        }
    }
    
    // MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        countries.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let country = countries[indexPath.section]
        cell.textLabel?.text = country.name.common
        
        let flagURLString = country.flags.png
        
        if !flagURLString.isEmpty, let flagURL = URL(string: flagURLString) {
            DispatchQueue.global().async {
                if let imageData = try? Data(contentsOf: flagURL) {
                    if let image = UIImage(data: imageData) {
                        let resizedImage = self.resizeImage(image: image, targetSize: CGSize(width: 40, height: 30))
                        DispatchQueue.main.async {
                            if let currentIndexPath = tableView.indexPath(for: cell), currentIndexPath.section == indexPath.section {
                                cell.imageView?.image = resizedImage
                                cell.setNeedsLayout()
                            }
                        }
                    }
                }
            }
        } else {
            cell.imageView?.image = UIImage(named: "flag_placeholder")
        }
        
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.backgroundColor = UIColor.clear
        cell.textLabel?.textColor = UIColor.black
        cell.accessoryType = .disclosureIndicator
        
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1.0
        cell.layer.cornerRadius = cell.frame.size.height / 2
        cell.layer.masksToBounds = true
        
        return cell
    }
    
    // MARK: - Helper Methods
    
    // Function to resize the image
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        let resizedImage = renderer.image { (context) in
            image.draw(in: CGRect(origin: .zero, size: targetSize))
        }
        
        return resizedImage
    }
    
}
