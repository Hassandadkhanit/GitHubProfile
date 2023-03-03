//
//  ResponseStatusModel.swift
//  GitHubProfile
//
//  Created by Hassan dad khan on 06/02/2023.
//

import Foundation
import Combine

enum ResponseStatus<T: Codable> {
    
    case failure(NetworkError?)
    case success(T?)
}

struct ResponseStatusModel<T: Codable> {

    private(set) var status: ResponseStatus<T>?
    var data: T?
    
    init() {
        
    }
    init(data: T?, status: ResponseStatus<T>, statusCode: Int = -1, statusMessage: String = "") {
        self.data = data
        self.status = status
    }
    
    //mutating function allow it self to change

    mutating func onSuccess(responseData : T? = nil) {
        self.data = responseData
        self.status = .success(responseData)
    }
    
    mutating func onFailure(error: NetworkError? = nil) {
        self.status = .failure(error)
    }
    
}
