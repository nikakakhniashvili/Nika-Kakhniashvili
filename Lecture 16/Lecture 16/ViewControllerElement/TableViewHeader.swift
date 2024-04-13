//
//  TableViewHeader.swift
//  Lecture 16
//
//  Created by Nika Kakhniashvili on 13.04.24.
//

import UIKit

class contactsTableViewHeader: UIView {
    
    // MARK: - Properties
    
    let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "Avatar")
        return imageView
    }()
    
    let ownerNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let disclosureIndicatorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "chevron.right")
        imageView.tintColor = .gray
        return imageView
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.gray.withAlphaComponent(0.2)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = UIColor.gray.withAlphaComponent(0.2)
        
        addSubview(avatarImageView)
        addSubview(ownerNameLabel)
        setupUI()
    }
    
    // MARK: - UI Setup
    
    func setupUI() {
        addSubview(avatarImageView)
        addSubview(ownerNameLabel)
        addSubview(disclosureIndicatorImageView)
        
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        ownerNameLabel.translatesAutoresizingMaskIntoConstraints = false
        disclosureIndicatorImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            avatarImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: 50),
            avatarImageView.heightAnchor.constraint(equalToConstant: 50),
            
            ownerNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 10),
            ownerNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            disclosureIndicatorImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -17),
            disclosureIndicatorImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    // MARK: - Configuration
    
    func configure(withName name: String) {
        ownerNameLabel.text = "Nika Kakhniashvili"
    }
    
}


