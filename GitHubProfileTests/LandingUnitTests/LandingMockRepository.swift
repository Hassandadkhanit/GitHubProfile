//
//  LandingMockRepository.swift
//  GitHubProfileTests
//
//  Created by Hassan dad khan on 01/03/2023.
//

import Foundation
import Combine
@testable import GitHubProfile

class LandingMockRepository: LandingRepositoryProtocol {
    var subscription = Set<AnyCancellable>()
    func getUserData(userName: String) -> Future<GitHubProfile.UserModel?, Error> {
        return Future<UserModel?, Error> { promise in
            APIClientHandler.shared.sendRequest(
                urlString: RouteUrls.getRouteUrlWith(route:                                                  RouteUrls.usersRoute) + "/\(userName)",
                                                parameters: [:],
                                                method: .get)
                .sink { completion in
                    switch completion {
                    case .failure(let error):
                        promise(.failure(error))
                    case .finished:
                        print("Finished")
                    }
                } receiveValue: { data in
                    do {
                       let userObj = try JSONDecoder().decode(UserModel.self, from: data)
                        promise(.success(userObj))
                    } catch (let error) {
                        promise(.failure(error))
                    }
                }.store(in: &self.subscription)
        }

    }
}
