//
//  ProfileUnitTests.swift
//  GitHubProfileTests
//
//  Created by Hassan dad khan on 01/03/2023.
//

import XCTest
import Combine
@testable import GitHubProfile

final class ProfileUnitTests: XCTestCase {

    var viewModel: ProfileViewModel?
    var mockRepository = ProfileMockRepository()
    private var subscription = Set<AnyCancellable>()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = ProfileViewModel(repository: mockRepository)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetRepositoryList() throws {
        let expectation =  expectation(description: "RepositoryList")
       viewModel?.repositoriesResultPublisher
              .receive(on: RunLoop.main)
              .sink(receiveValue: { result in
                  switch result {
                  case .failure(let error):
                      XCTFail(error.localizedDescription)
                      break
                  case.success(_):
                      expectation.fulfill()
                      break
                  default:
                      print("none")
                  }
              }).store(in: &subscription)
        
        viewModel?.getRepositoriesList(urlString: "https://api.github.com/users/test/repos")
        wait(for: [expectation], timeout: 5.0)
        
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
