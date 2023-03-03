//
//  ViewExtension.swift
//  GitHubProfile
//
//  Created by Hassan dad khan on 26/10/2022.
//

import Foundation
import UIKit

@IBDesignable
extension UIView {
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }set {
            self.clipsToBounds = true
            self.layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor {
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue.cgColor
        }
    }
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            self.layer.shadowRadius = newValue
        }
    }
    @IBInspectable
    var shadowOffset: CGSize {
        get{
            return layer.shadowOffset
        }set{
            
            self.layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor {
        get{
            return UIColor.init(cgColor: layer.shadowColor!)
        }
        set {
            self.layer.shadowColor = newValue.cgColor
        }
    }
    @IBInspectable
    var shadowOpacity: Float {
        get{
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    @IBInspectable
    var masksToBounds: Bool {
        get{
            return layer.masksToBounds
        }
        set {
            
            layer.masksToBounds = newValue
        }
    }
    func addBorder(color: UIColor = UIColor.black, borderWidth: CGFloat = 0.5) {
        self.layoutSubviews()
        self.clipsToBounds = true
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = color.cgColor
    }
}
