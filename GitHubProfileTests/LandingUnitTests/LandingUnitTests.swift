//
//  LandingTests.swift
//  GitHubProfileTests
//
//  Created by Hassan dad khan on 06/07/2022.
//

import XCTest
import Combine
@testable import GitHubProfile

class LandingUnitTests: XCTestCase {

    var viewModel = LandingViewModel()
    var subscription = Set<AnyCancellable>()
    var mockRespository = LandingMockRepository()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.viewModel = LandingViewModel(landingRepositoryProtocol: mockRespository)

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testIfUsernameIsEmptyAndNotValid() {
        let value = viewModel.isUsernameValid(userName: "")
        XCTAssertFalse(value)
    }
    func testResponseIsValid() {
        let expectation = expectation(description: "getUserDataExpectation")

        viewModel.userResultPublisher
              .sink(receiveValue: { result in
                  switch result {
                  case .failure(let error):
                      XCTFail(error.localizedDescription)
                      break
                  case .success(let user):
                      if let _ = user {
                          expectation.fulfill()
                      }
                      break
                  case .none:
                      print("none")
                  }
              }).store(in: &subscription)
        
        viewModel.getUserData(userName: "test")
        waitForExpectations(timeout: 5.0,handler: nil)
    }

}
