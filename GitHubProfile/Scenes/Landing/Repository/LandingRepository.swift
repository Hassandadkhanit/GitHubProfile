//
//  LandingService.swift
//  GitHubProfile
//
//  Created by Hassan dad khan on 06/07/2022.
//

import Foundation
import Combine



protocol LandingRepositoryProtocol {
    func getUserData(userName: String) -> Future<UserModel?, Error>
}
class LandingRepository : LandingRepositoryProtocol {
    // MARK: - API Calling
    var subscription = Set<AnyCancellable>()
    func getUserData(userName: String)  -> Future<UserModel?, Error> {
        return Future<UserModel?, Error> { promise in
            APIClientHandler.shared.sendRequest(urlString: RouteUrls.getRouteUrlWith(route:                                                  RouteUrls.usersRoute) + "/\(userName)",
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
    
    // MARK: - DataBase Implementation
    func addUserDataFromDataBase() {
        let user =  UserEntity(context: CoreDataManager.shared.context)
        user.name = "hassan"
        CoreDataManager.shared.saveContext()
    }
    func getUserDataFromDataBase() {
        do {
            guard let result = try CoreDataManager.shared.context.fetch(UserEntity.fetchRequest()) as? [UserEntity] else {
                return
            }
            print(result.forEach({ user in
                debugPrint("")
            }))
            
        } catch (let error) {
            print(error.localizedDescription)
        }
    }
    
    
}
