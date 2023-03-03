//
//  RouteUrls.swift
//  GitHubProfile
//
//  Created by Hassan dad khan on 06/07/2022.
//

import Foundation

struct RouteUrls {
    
    static let usersRoute               = "users"
    
    static func getRouteUrlWith(route:String) -> String  {
        let baseUrl = BuildConfiguration.shared.baseUrl
        return baseUrl + route
    }
}
