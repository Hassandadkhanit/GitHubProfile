//
//  BaseViewModel.swift
//  GitHubProfile
//
//  Created by Hassan dad khan on 22/02/2023.
//

import Foundation
protocol BaseViewModelProtocol {

    var isLoadingStatePublisher: Published<Bool>.Publisher {get}
    var isLoadingState: Bool {get}
}
class  BaseViewModel {
    init() {
        
    }
}
