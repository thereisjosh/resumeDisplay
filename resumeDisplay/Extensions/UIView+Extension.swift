//
//  UIView+Extension.swift
//  resume
//
//  Created by Joshua Ang on 18/6/21.
//

import UIKit

extension UIView {
  @IBInspectable  var cornerRadii: CGFloat {
    get { return self.cornerRadii }
        set {
            self.layer.cornerRadius = newValue
            
        }
    }
}


