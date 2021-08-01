//
//  OnboardingCollectionViewCell.swift
//  resume
//
//  Created by Joshua Ang on 18/6/21.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLabel: UILabel!
    @IBOutlet weak var slideDescLabel: UILabel!
    
    
    func setup(_ slide: OnboardingSlide) {
        slideImageView.image = slide.image
        slideTitleLabel.text = slide.title
        slideDescLabel.text = slide.description
        
    }
}
