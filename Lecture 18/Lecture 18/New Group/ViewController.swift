//
//  ViewController.swift
//  Lecture 18
//
//  Created by Nika Kakhniashvili on 20.04.24.
//

import UIKit

class ViewController: UIViewController {
    
    // Define the table view
    private let tableView = UITableView()
    private var newsList: [NewsArticle] = [] // Renamed from List to newsList
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        // Set up the table view
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)
        
        // Add constraints to the table view
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        let newsList = NewsList() // Create an instance of NewsList
        newsList.fetchData { [weak self] articles in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.newsList = articles
                self.tableView.reloadData()
            }
        }
    }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        let article = newsList[indexPath.row]
        cell.titleLabel.text = article.title
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            // First section header with title "Panicka News"
            let headerView = UIView()
            headerView.backgroundColor = .clear
            
            // Create a UILabel for the title
            let titleLabel = UILabel()
            titleLabel.text = "Panicka News"
            titleLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
            titleLabel.textAlignment = .left
            titleLabel.numberOfLines = 0 // Allow multiple lines if needed
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            headerView.addSubview(titleLabel)
            
            // Position the label
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: -30),
                titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 2)
            ])
            
            return headerView
        } else {
            // Blank section headers for other sections
            let headerView = UIView()
            headerView.backgroundColor = .clear
            return headerView
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        section == 0 ? 40 : 20
    }
}

