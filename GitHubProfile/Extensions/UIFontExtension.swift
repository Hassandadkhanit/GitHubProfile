//
//  UIFontExtension.swift
//  GitHubProfile
//
//  Created by Hassan dad khan on 04/03/2023.
//

import Foundation
import UIKit

extension UIFont {
    
    class func robotoBold(fontSize: CGFloat) -> UIFont {
        
        return UIFont.init(name: "Roboto-Bold", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    class func robotoRegular(fontSize: CGFloat) -> UIFont {
        
        return UIFont.init(name: "Roboto-Regular", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
    class func robotoMedium(fontSize: CGFloat) -> UIFont {
        
        return UIFont.init(name: "Roboto-Medium", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
    }
}
