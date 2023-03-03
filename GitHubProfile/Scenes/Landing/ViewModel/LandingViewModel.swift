//
//  LandingViewModel.swift
//  GitHubProfile
//
//  Created by Hassan dad khan on 06/07/2022.
//

import Foundation
import CoreData
import Combine

enum ReposeDynamic <T> {
    case failure(Error)
    case success(T)
}

protocol LandingViewModelProtocol {
    
    var user: UserModel? {get }
    var isLoading : Bool {get }
    var userResult: Result<UserModel?,Error>? { get}
    
    var userPublisher : Published<UserModel?>.Publisher {get}
    var isLoadingResultPublisher : Published<Bool>.Publisher {get}
    var userResultPublisher: Published<Result<UserModel?,Error>?>.Publisher { get}
    
    func getUserData(userName: String)
    func isUsernameValid (userName : String) -> Bool
    
}

class LandingViewModel: LandingViewModelProtocol {
    
    
    @Published private(set) var user: UserModel?
    @Published private(set) var isLoading : Bool = false
    @Published private(set) var userResult: Result<UserModel?,Error>?
    
    var userPublisher : Published<UserModel?>.Publisher {$user}
    var isLoadingResultPublisher : Published<Bool>.Publisher {$isLoading}
    var userResultPublisher: Published<Result<UserModel?,Error>?>.Publisher { $userResult}


    var landingRepositoryProtocol : LandingRepositoryProtocol?
    var subscription = Set<AnyCancellable>()
    
    init(landingRepositoryProtocol : LandingRepositoryProtocol = LandingRepository()) {
        self.landingRepositoryProtocol = landingRepositoryProtocol
    }
    //MARK: - API Calling
    func getUserData(userName: String) {
        self.isLoading = true
        _ = self.landingRepositoryProtocol?.getUserData(userName: userName)
            .receive(on: RunLoop.main)
            .sink { [weak self] response in
                self?.isLoading = false
                switch response {
                case .failure(let error):
                    self?.userResult = .failure(error)
                    break
                case .finished:
                    print("User data finished")
                    break
                }
            } receiveValue: { [weak self] result in
                self?.userResult = .success(result)
                self?.user = result
            }.store(in: &self.subscription)
        
    }
    //MARK: - Validation
    func isUsernameValid (userName : String) -> Bool {
        return !(userName.isBlank)
    }
    
}

