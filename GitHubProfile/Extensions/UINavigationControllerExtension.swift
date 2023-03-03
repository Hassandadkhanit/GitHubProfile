//
//  UINavigationControllerExtension.swift
//  GitHubProfile
//
//  Created by Hassan dad khan on 10/01/2023.
//

import Foundation
import UIKit

extension UINavigationController {
    
    func openLandingVC() {
        let landingVC = LandingViewController.init()
        self.pushViewController(landingVC, animated: true)
    }
    
    func openProfileVC(user: UserModel? = nil) {
        let viewModel = ProfileViewModel(userData: user)
        let profileVC = ProfileViewController.init(viewModel: viewModel)
        self.pushViewController(profileVC, animated: true)
    }
    
}
