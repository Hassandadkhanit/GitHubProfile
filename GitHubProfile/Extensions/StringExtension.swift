//
//  StringExtension.swift
//  GitHubProfile
//
//  Created by Hassan dad khan on 06/07/2022.
//

import Foundation
extension String {
    ///To check string is blank or not
    var isBlank: Bool {
        get {
            return trimmingCharacters(in: CharacterSet.whitespaces).isEmpty
        }
    }
    func convertToDate(formate: String) -> Date? {
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.dateFormat = formate
       return formatter.date(from: self)
    }
    func convertDateTo(date: Date,formate: String) -> String? {
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.dateFormat = formate
        return formatter.string(from: date)
    }
    func convertDate(fromFormate: String, toFormate: String) -> String {
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.dateFormat = fromFormate
        if let date = formatter.date(from: self) {
            formatter.dateFormat = toFormate
            return formatter.string(from: date)
        }
        
        return ""
    }
}
