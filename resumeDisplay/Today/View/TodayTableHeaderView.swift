//
//  TodayTableHeaderView.swift
//  resume
//
//  Created by Joshua Ang on 25/6/21.
//

import UIKit

class TodayTableHeaderView: UIView {

    let subLabel = UILabel()
    let todayLabel = UILabel()
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
        subLabel.text = "EMPLOYMENT"
        subLabel.textColor = .gray
        subLabel.font = UIFont.boldSystemFont(ofSize: 13)
        subLabel.frame = CGRect(x: 20, y: 33, width: 200, height: 15)
        
        todayLabel.text = "Experience"
        todayLabel.font = UIFont.boldSystemFont(ofSize: 34)
        todayLabel.frame = CGRect(x: 20, y: 48, width: 200, height: 40)
        
        iconButton.setImage(#imageLiteral(resourceName: "cover_4"), for: .normal)
        iconButton.frame = CGRect(x: kScreenW - 20 - 40, y: 50, width: 38, height: 38)
        iconButton.layer.cornerRadius = GlobalConstants.iconCornerRadius
//        iconButton.layer.borderColor = GlobalConstants.iconBorderColor
//        iconButton.layer.borderWidth = GlobalConstants.iconBorderWidth
        iconButton.addTarget(self, action: #selector(iconButtonAction), for: .touchUpInside)
        
        addSubview(subLabel)
        addSubview(todayLabel)
        addSubview(iconButton)
    }
    
    @objc private func iconButtonAction() {
        iconButtonClosure?()
    }

}
