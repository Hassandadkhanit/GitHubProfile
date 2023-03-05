//
//  BuildConfiguration.swift
//  GitHubProfile
//
//  Created by Hassan dad khan on 04/03/2023.
//

import Foundation
enum Environment: String { // 1
    case debugDevelopment = "Debug Development"
    case releaseDevelopment = "Release Development"

    case debugStaging = "Debug Staging"
    case releaseStaging = "Release Staging"

    case debugProduction = "Debug Production"
    case releaseProduction = "Release Production"
}

class BuildConfiguration { // 2
    static let shared = BuildConfiguration()
    var environment: Environment?
    var baseURL: String { // 1
        switch self.environment {
        case .debugDevelopment, .releaseDevelopment:
            return "https://api.github.com/"
        case .debugStaging, .releaseStaging:
            return "https://staging.example.com/api"
        case .debugProduction, .releaseProduction:
            return "https://example.com/api"
        case .none:
            return ""
        }
    }
    init() {
        if let currentConfiguration = Bundle.main.object(forInfoDictionaryKey: "Configuration") as? String,
            let environment = Environment(rawValue: currentConfiguration) {
            self.environment = environment
        }
    }
}
