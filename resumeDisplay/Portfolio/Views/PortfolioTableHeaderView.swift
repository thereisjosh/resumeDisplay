//
//  PortfolioTableHeaderView.swift
//  resume
//
//  Created by Joshua Ang on 13/7/21.
//

import UIKit

class PortfolioTableHeaderView: UIView {

        let todayLabel = UILabel()
        let subLabel = UILabel()
        let iconButton = UIButton()
        
        var iconButtonClosure: (()->())?
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupUI()
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func setupUI() {
            
            subLabel.text = "PROJECTS"
            subLabel.textColor = .gray
            subLabel.font = UIFont.boldSystemFont(ofSize: 13)
            subLabel.frame = CGRect(x: 20, y: 33, width: 200, height: 15)
            
            todayLabel.text = "Portfolio"
            todayLabel.font = UIFont.boldSystemFont(ofSize: 34)
            todayLabel.frame = CGRect(x: 20, y: 48, width: 200, height: 40)
            
            iconButton.setImage(#imageLiteral(resourceName: "cover_4"), for: .normal)
            iconButton.frame = CGRect(x: kScreenW - 20 - 40, y: 50, width: 38, height: 38)
            iconButton.layer.cornerRadius = GlobalConstants.iconCornerRadius
            iconButton.addTarget(self, action: #selector(iconButtonAction), for: .touchUpInside)
            
            addSubview(todayLabel)
            addSubview(iconButton)
            addSubview(subLabel)
        }
        
        @objc private func iconButtonAction() {
            iconButtonClosure?()
        }

    }

