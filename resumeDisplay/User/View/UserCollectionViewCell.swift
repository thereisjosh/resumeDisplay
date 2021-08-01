//
//  UserCollectionViewCell.swift
//  resume
//
//  Created by Joshua Ang on 17/7/21.
//

import UIKit

class UserCollectionViewCell: UICollectionViewCell {
    
    let userCell = UICollectionViewCell()
    var slideImageView = UIImageView()
    var imageBackground = UIView()
    var slideTitleLabel = UILabel()
    var slideDescLabel = UILabel()
    

        override init(frame: CGRect) {
            super.init(frame: frame)
            cellContent()
        }

        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

    func cellContent() {
        
        addSubview(userCell)
        userCell.addSubview(slideDescLabel)
        userCell.addSubview(slideTitleLabel)
        userCell.addSubview(imageBackground)
        imageBackground.addSubview(slideImageView)


        userCell.frame = CGRect(x: 0, y: 0, width: kScreenW, height: 70)
        
        slideImageView.frame = CGRect(x: 10, y: 10, width: 20, height: 20)
        slideImageView.isOpaque = true
        imageBackground.frame = CGRect(x: 20, y: 5, width: 40, height: 40)
        imageBackground.layer.cornerRadius = 10
 
        
        slideDescLabel.translatesAutoresizingMaskIntoConstraints = false
        slideDescLabel.font = .boldSystemFont(ofSize: 16)
        slideDescLabel.frame.size.width = 230
        slideDescLabel.frame.size.height = 50
        slideDescLabel.leftAnchor.constraint(equalTo: imageBackground.rightAnchor, constant: 10).isActive = true
        slideDescLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        slideDescLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        slideDescLabel.numberOfLines = 0
        
//        slideTitleLabel.frame = CGRect(x: 310, y: 5 , width: 100, height: 40)
        slideTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        slideTitleLabel.font = .systemFont(ofSize: 13)
        slideTitleLabel.frame.size.width = 100
        slideTitleLabel.frame.size.height = 40
        slideTitleLabel.topAnchor.constraint(equalTo: slideDescLabel.bottomAnchor, constant: 3).isActive = true
        slideTitleLabel.leftAnchor.constraint(equalTo: imageBackground.rightAnchor, constant: 10).isActive = true
        slideTitleLabel.textColor = .secondaryLabel

    }
              
    
}
