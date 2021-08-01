//
//  DetailScrollView.swift
//  resume
//
//  Created by Joshua Ang on 25/6/21.
//

import UIKit

class DetailScrollView: UIScrollView {

    let bgBackView = UIView()
    let imageView = UIImageView()
    let textView = UITextView()
    let titleView = UILabel()
    let subtitleView = UILabel()
    let descView = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        bgBackView.frame = CGRect(x: 0, y: 0, width: kScreenW, height: GlobalConstants.cardDetailTopImageH)
        bgBackView.layer.masksToBounds = true
        
        imageView.frame = bgBackView.bounds
        imageView.isUserInteractionEnabled = true
        imageView.contentMode = .scaleAspectFill
        
        let textViewWidth = kScreenW - 2 * textViewLeftMargin
        
        // change font and size here
        let font = UIFont(name: "Helvetica Neue", size: 20)
        let textHeight = textViewText.calculateHeightWith(width: textViewWidth, font: font!)
        textView.frame = CGRect(x: textViewLeftMargin, y: bgBackView.frame.height + textViewTopMargin, width: textViewWidth, height: textHeight + textViewBottomMargin)
        textView.text = textViewText
        textView.font = font
        
        // change text color here
        textView.textColor = .lightGray
        textView.isEditable = false
        
        bgBackView.addSubview(imageView)
        addSubview(bgBackView)
        addSubview(textView)
        addSubview(titleView)
        addSubview(subtitleView)
        addSubview(descView)
    
        contentSize = CGSize(width: kScreenW, height: bgBackView.frame.height + textViewTopMargin + textView.frame.height + textViewBottomMargin)
        
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
        subtitleView.topAnchor.constraint(equalTo: bgBackView.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true

        descView.textColor = UIColor.white
        descView.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        descView.translatesAutoresizingMaskIntoConstraints = false
        descView.lineBreakMode = NSLineBreakMode.byWordWrapping
        descView.numberOfLines = 0
        descView.leftAnchor.constraint(equalTo: bgBackView.safeAreaLayoutGuide.leftAnchor, constant: 17).isActive = true
        descView.bottomAnchor.constraint(equalTo: bgBackView.safeAreaLayoutGuide.bottomAnchor, constant: -15).isActive = true
        descView.rightAnchor.constraint(equalTo: bgBackView.safeAreaLayoutGuide.rightAnchor, constant: 17).isActive = true
        
    }
}


fileprivate let textViewLeftMargin: CGFloat = 15
fileprivate let textViewTopMargin: CGFloat = 30
fileprivate let textViewBottomMargin: CGFloat = 50
fileprivate var textViewText = "Thank you. I'm honored to be with you today for your commencement from one of the finest universities in the world. Truth be told, i never graduated from college and this is the closest I've ever gotten to a college gradution. \n\nToday i want to tell you three stories from my life. That's it. No big deal. Just three stories. The first story is about connecting the dots. \n\ndropped out of Reed College after the first 6 months, but then stayed around as a drop-in for another 18 months or so before I really quit. So why did I drop out? \n\nIt started before I was born. My biological mother was a young,unwed college graduate student, and she decided to put me up for adoption. She felt very strongly that I should be adopted by college graduates, so everything was all set for me to be adopted at birth by a lawyer and his wife. Except that when I popped out they decided at the last minute that they really wanted a girl. So my parents, who were on a waiting list, got a call in the middle of the night asking: 'We got an unexpected baby boy; do you want him?' They said: 'Of course.' My biological mother found out later that my mother had never graduated from college and  my father had never graduated from high school. She refused to sign the final adoption papers. She only relented a few months later when my parents promised that I would  go to college."

