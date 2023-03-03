//
//  UIViewControllerExtension.swift
//  GitHubProfile
//
//  Created by Hassan dad khan on 27/10/2022.
//

import Foundation
import UIKit

extension UIViewController {
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            let controllerName: String = String(describing: T.self)
            return T.init(nibName: controllerName, bundle: nil)
        }
        
        return instantiateFromNib()
    }
    func presentAlertWithTitleAndMessage(title: String, message: String, options: String..., completion: @escaping (Int) -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (index, option) in options.enumerated() {
            alertController.addAction(UIAlertAction.init(title: option, style: .default, handler: { (action) in
                completion(index)
            }))
        }
        self.present(alertController, animated: true, completion: nil)
    }
    
}
