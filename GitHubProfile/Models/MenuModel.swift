//
//  MenuModel.swift
//  GitHubProfile
//
//  Created by Hassan dad khan on 06/02/2023.
//

import Foundation

struct MenuModel: Codable {
    var title : String? = ""
    var description: String? = ""
    var iconName:  String? = ""
    
    enum CodingKeys: CodingKey {
        case title
        case description
    }
    
    init(title: String,description: String = "", iconName: String = "") {
        self.title = title
        self.description = description
        self.iconName = iconName
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
    }
    
}
