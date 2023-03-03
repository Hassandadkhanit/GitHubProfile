//
//  ProfileViewModel.swift
//  GitHubProfile
//
//  Created by Hassan dad khan on 06/02/2023.
//

import Foundation
import Combine
protocol ProfileViewModelProtocol: BaseViewModelProtocol {
    var userResultPublisher: Published<UserModel?>.Publisher {get}
    var isLoadingStatePublisher: Published<Bool>.Publisher {get}
    var repositoriesListPublisher: Published<[RepoModel]?>.Publisher {get}
    var repositoriesResultPublisher: Published<Result<[RepoModel]?,Error>?>.Publisher {get}
    
    var isLoadingState: Bool {get}
    var user: UserModel? {get}
    var repositoriesList: [RepoModel]? {get}
    var repositoriesResult: Result<[RepoModel]?,Error>? {get}
    func getRepositoriesList(urlString: String)
}

class ProfileViewModel:  ProfileViewModelProtocol {
    
    var userResultPublisher: Published<UserModel?>.Publisher {$user}
    var isLoadingStatePublisher: Published<Bool>.Publisher {$isLoadingState}
    var repositoriesListPublisher: Published<[RepoModel]?>.Publisher {$repositoriesList}
    var repositoriesResultPublisher: Published<Result<[RepoModel]?,Error>?>.Publisher {$repositoriesResult}

    
    @Published var user: UserModel?
    @Published var repositoriesList: [RepoModel]?
    @Published var repositoriesResult: Result<[RepoModel]?,Error>?
    @Published var isLoadingState: Bool = false
    
    var repository: ProfileRepositoryProtocol?
    var subscription = Set<AnyCancellable>()
    
    
    
    func getRepositoriesList(urlString: String) {
        
        self.isLoadingState = true
        _ = self.repository?.getRepositoriesList(url: urlString)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoadingState = false
                switch completion {
                case .failure(let error):
                    self?.repositoriesResult = .failure(error)
                    print(error)
                    break
                case .finished:
                    print("get RepositoriesList Finished")
                    break
                }
            }, receiveValue: { [weak self] repoResult in
                self?.repositoriesResult = .success(repoResult)
                self?.repositoriesList = repoResult
            })
            .store(in: &subscription)
        
    }
    
    init(repository: ProfileRepositoryProtocol = ProfileRepository(), userData: UserModel? = nil) {
        self.user = userData
        self.repository = repository
    }
    
    
}
