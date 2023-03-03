//
//  Utilities.swift
//  GitHubProfile
//
//  Created by Hassan dad khan on 28/02/2023.
//

import Foundation
import UIKit


class Utilities {
    static  func offsetFrom(previousDate: Date) {
        let calendarDate = Calendar.current.dateComponents([.day, .year, .month], from: previousDate)
    }
    static func openUrl(url: URL) {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
}
