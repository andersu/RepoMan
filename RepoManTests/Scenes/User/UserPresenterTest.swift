//
//  UserPresenterTest.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 24/01/17.
//  Copyright © 2017 Anders Ullnæss. All rights reserved.
//

import Foundation
import XCTest
@testable import RepoMan

class UserPresenterTest: XCTestCase {
    let userPresenter = UserPresenter(viewModel: UserViewModel())
    let mockOutput = MockUserPresenterOutput()
    
    override func setUp() {
        super.setUp()
        userPresenter.output = mockOutput
    }
    
    // MARK: Tests
    func test_fetchedUser_callsOutputPresent_withViewModel() {
        let username = "username"
        let name = "name"
        let publicRepos = 42
        let avatarUrl = "https://avatarurl.com/avatar.png"
        
        let user = User(username: username, name: name, publicRepos: publicRepos, avatarUrl: avatarUrl)
        let expectation1 = expectation(description: "present called")
        
        userPresenter.fetched(user: user)
        
        AsyncTestUtil.check(expectation1, everyMilisec: 1) { () -> Bool in
            return self.mockOutput.viewModel != nil
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }
    
    func test_failedToFetchUser_callsShowErrorAlert_withFailedToGetUserErrorAlert() {
        let expectation1 = expectation(description: "showErrorAlert called")
        
        userPresenter.failedToFetchUser()
        
        AsyncTestUtil.check(expectation1, everyMilisec: 1) { () -> Bool in
            return self.mockOutput.alertController != nil
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
        
        XCTAssertEqual(Constants.Errors.FailedToGetUser.title, mockOutput.alertController?.title)
        XCTAssertEqual(Constants.Errors.FailedToGetUser.message, mockOutput.alertController?.message)
    }
    
    func test_userNotFound_callsShowErrorAlert_withUserNotFoundErrorAlert() {
        let expectation1 = expectation(description: "showErrorAlert called")
        
        userPresenter.userNotFound()
        
        AsyncTestUtil.check(expectation1, everyMilisec: 1) { () -> Bool in
            return self.mockOutput.alertController != nil
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
        
        XCTAssertEqual(Constants.Errors.UserNotFound.title, mockOutput.alertController?.title)
        XCTAssertEqual(Constants.Errors.UserNotFound.message, mockOutput.alertController?.message)
    }
}

// MARK: Mocks
class MockUserPresenterOutput: UserPresenterOutput {
    private (set) var viewModel: UserViewModel?
    private (set) var alertController: UIAlertController?
    
    func present(viewModel: UserViewModel) {
        self.viewModel = viewModel
    }
    
    func showErrorAlert(alertController: UIAlertController) {
        self.alertController = alertController
    }
}
