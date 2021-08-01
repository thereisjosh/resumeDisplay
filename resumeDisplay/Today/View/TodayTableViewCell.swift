//
//  TodayTableViewCell.swift
//  resume
//
//  Created by Joshua Ang on 25/6/21.
//

import UIKit

class TodayTableViewCell: UITableViewCell {
    
    let bgBackView = UIView()
    let bgImageView = UIImageView()
    let emptyView = UIView()
    let titleView = UILabel()
    let subtitleView = UILabel()
    let descView = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        bgBackView.addSubview(bgImageView)
        contentView.addSubview(bgBackView)
        contentView.addSubview(emptyView)
        contentView.addSubview(titleView)
        contentView.addSubview(subtitleView)
        contentView.addSubview(descView)
        
        bgBackView.frame = CGRect(x: GlobalConstants.leftMargin, y: 0, width: GlobalConstants.todayCardSize.width, height: GlobalConstants.todayCardSize.height)
        bgBackView.layer.shadowColor = UIColor.black.cgColor
        bgBackView.layer.shadowOpacity = 0.4
        bgBackView.layer.shadowOffset = CGSize(width: 0, height: 1)
        
        bgImageView.frame = bgBackView.bounds
        bgImageView.contentMode = .scaleAspectFill
        bgImageView.layer.cornerRadius = GlobalConstants.toDayCardCornerRadius
        bgImageView.layer.masksToBounds = true
        
        emptyView.backgroundColor = UIColor.white.withAlphaComponent(0)
        emptyView.frame = CGRect(x: 0, y: (bgImageView.frame.size.height)-20, width: GlobalConstants.todayCardSize.width, height: GlobalConstants.toDayCardRowH - GlobalConstants.todayCardSize.height)
        
        titleView.textColor = UIColor.white
        titleView.font = UIFont.boldSystemFont(ofSize: 32)
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.lineBreakMode = NSLineBreakMode.byWordWrapping
        titleView.numberOfLines = 0
        titleView.leftAnchor.constraint(equalTo: bgBackView.safeAreaLayoutGuide.leftAnchor, constant: 17).isActive = true
        titleView.topAnchor.constraint(equalTo: subtitleView.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        titleView.rightAnchor.constraint(equalTo: bgBackView.safeAreaLayoutGuide.rightAnchor, constant: 17).isActive = true

        subtitleView.textColor = UIColor.lightGray
        subtitleView.font = UIFont.boldSystemFont(ofSize: 15)
        subtitleView.translatesAutoresizingMaskIntoConstraints = false
        subtitleView.lineBreakMode = NSLineBreakMode.byWordWrapping
        subtitleView.numberOfLines = 0
        subtitleView.leftAnchor.constraint(equalTo: bgBackView.safeAreaLayoutGuide.leftAnchor, constant: 17).isActive = true
        subtitleView.topAnchor.constraint(equalTo: bgBackView.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        
        descView.textColor = UIColor.white
        descView.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        descView.translatesAutoresizingMaskIntoConstraints = false
        descView.lineBreakMode = NSLineBreakMode.byWordWrapping
        descView.numberOfLines = 0
        descView.leftAnchor.constraint(equalTo: bgBackView.safeAreaLayoutGuide.leftAnchor, constant: 17).isActive = true
        descView.bottomAnchor.constraint(equalTo: bgBackView.safeAreaLayoutGuide.bottomAnchor, constant: -15).isActive = true
        descView.rightAnchor.constraint(equalTo: bgBackView.safeAreaLayoutGuide.rightAnchor, constant: 10).isActive = true
        
    }
    
}

