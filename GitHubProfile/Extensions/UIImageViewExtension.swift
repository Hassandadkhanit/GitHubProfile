//
//  UIImageExtension.swift
//  GitHubProfile
//
//  Created by Hassan dad khan on 17/01/2023.
//

import UIKit
import SDWebImage

extension UIImageView {
    func setImage(withUrl url : String, withPlaceHolder placeholder : String)  {
        
        self.sd_setImage(
            with: URL.init(string: url),
            placeholderImage: placeholder.isBlank ? UIImage() : UIImage(named: placeholder),
            options: .allowInvalidSSLCertificates,
            completed: nil)

    }
}
