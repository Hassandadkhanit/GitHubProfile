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
    var baseUrl = "https://api.github.com/"
    var environment: Environment
    

    
    init() {
        let currentConfiguration = Bundle.main.object(forInfoDictionaryKey: "Configuration") as! String
        
        environment = Environment(rawValue: currentConfiguration)!
        
        switch environment {
        case .debugDevelopment,.releaseDevelopment:
            baseUrl = "https://api.github.com/"
            break
        case .debugStaging,.releaseStaging:
            baseUrl = "https://api.github.com/"
            break
        case .debugProduction,.releaseProduction:
            baseUrl = "https://api.github.com/"
            break
        }
    }
}
