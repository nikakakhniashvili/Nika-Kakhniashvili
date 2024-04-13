//
//  ViewController.swift
//  Lecture 16
//
//  Created by Nika Kakhniashvili on 13.04.24.
//

import UIKit

class ContactsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Properties
    
    var tableView: UITableView!
    let sortedFirstLetters = Array(Set(contacts.map { String($0.name.prefix(1)) })).sorted()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        addLargeTitle()
        addHeaderView()
    }
    
    // MARK: UI Setup
    
    func setupTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellIdentifier")
    }
    
    func addLargeTitle() {
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "iOS Squad"
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .largeTitle)
        ]
        view.backgroundColor = .white
    }
    
    func addHeaderView() {
        let headerView = contactsTableViewHeader(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height:80))
        headerView.configure(withName: "Nika Kakhniashvili")
        headerView.setupUI()
        tableView.tableHeaderView = headerView
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionLetter = sortedFirstLetters[section]
        let count = contacts.filter { $0.name.hasPrefix(sectionLetter) }.count
        
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        let sectionLetter = sortedFirstLetters[indexPath.section]
        let contactsInSection = contacts.filter { $0.name.hasPrefix(sectionLetter) }
        let contact = contactsInSection[indexPath.row]
        
        cell.textLabel?.text = contact.name
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sortedFirstLetters[section]
    }
    
    // MARK: - UITableViewDelegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sortedFirstLetters.count
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return [
            "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
            "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "#"
        ]
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return sortedFirstLetters.firstIndex(of: title) ?? 0
    }
    
}

