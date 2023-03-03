//
//  ResourcesState.swift
//  GitHubProfile
//
//  Created by Hassan dad khan on 07/12/2022.
//

import Foundation
import UIKit
import Combine


class ResourcesState<T> {
    
    init() {
    }
    
    var success = PassthroughSubject<T,Error>()
}
