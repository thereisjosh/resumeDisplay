//
//  String+Extension.swift
//  resume
//
//  Created by Joshua Ang on 25/6/21.
//

import UIKit


extension String {
    /// Calculate text's height from `width` and `front`.
    func calculateHeightWith(width: CGFloat, font: UIFont)-> CGFloat {
        let attr = [NSAttributedString.Key.font: font]
        let maxSize: CGSize = CGSize(width: width, height: CGFloat(MAXFLOAT))
        let option = NSStringDrawingOptions.usesLineFragmentOrigin
        return self.boundingRect(with: (maxSize), options: option, attributes: attr, context: nil).size.height
    }
}
