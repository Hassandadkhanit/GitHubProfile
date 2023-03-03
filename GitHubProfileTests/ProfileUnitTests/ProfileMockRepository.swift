//
//  ProfileMockRepository.swift
//  GitHubProfileTests
//
//  Created by Hassan dad khan on 02/03/2023.
//

import Foundation
import Combine
@testable import GitHubProfile

class ProfileMockRepository: ProfileRepositoryProtocol {
    private var subscription = Set<AnyCancellable>()

    func getRepositoriesList(url: String) -> Future<[RepoModel]?, Error> {
        return Future<[RepoModel]?, Error> {promise in
            APIClientHandler.shared.sendRequest(urlString: url, parameters: [:], method: .get)
                .sink { completion in
                    switch completion {
                    case .failure(let error):
                        promise(.failure(error))
                        break
                    case .finished:
                        print("Repo called Finished")
                        break
                    }
                } receiveValue: { data in
                    do {
                       let obj = try JSONDecoder().decode([RepoModel].self, from: data)
                        promise(.success(obj))
                    } catch (let error) {
                        promise(.failure(error))
                    }
                }.store(in: &self.subscription)

        }
    }
    
    
}
