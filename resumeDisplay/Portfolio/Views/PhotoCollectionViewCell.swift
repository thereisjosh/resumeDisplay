//
//  PhotoCollectionViewCell.swift
//  resume
//
//  Created by Joshua Ang on 24/7/21.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
        
        let userCell = UICollectionViewCell()
        let bgBackView = UIView()
        var slideImageView = UIImageView()

            override init(frame: CGRect) {
                super.init(frame: frame)
                cellContent()
            }

            required init?(coder aDecoder: NSCoder) {
                fatalError("init(coder:) has not been implemented")
            }

        func cellContent() {
            addSubview(userCell)
            addSubview(bgBackView)
            userCell.addSubview(slideImageView)
            userCell.clipsToBounds = true
            userCell.frame = CGRect(x: 0, y: 0, width: 155, height: 155)
            slideImageView.frame = CGRect(x: 0, y: 0, width: 155, height: 155)
 
          
        }
                  
        
    }


