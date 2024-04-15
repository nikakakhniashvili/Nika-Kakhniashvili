//
//  CustomCollectionViewCell.swift
//  Lecture 17
//
//  Created by Nika Kakhniashvili on 15.04.24.
//
import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let boldLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "FiraGO-Regular", size: 18)
        label.textAlignment = .center
        return label
    }()
    
    let regularLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "FiraGO-Regular", size: 14)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        
        
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        
        addSubview(iconImageView)
        addSubview(boldLabel)
        addSubview(regularLabel)
        
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        boldLabel.translatesAutoresizingMaskIntoConstraints = false
        regularLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        let iconSize: CGFloat = 45
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            iconImageView.widthAnchor.constraint(equalToConstant: iconSize),
            iconImageView.heightAnchor.constraint(equalToConstant: iconSize),
        ])
        
      
        NSLayoutConstraint.activate([
            boldLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 8),
            boldLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            boldLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            regularLabel.topAnchor.constraint(equalTo: boldLabel.bottomAnchor, constant: 4),
            regularLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            regularLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            regularLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
}
