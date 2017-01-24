//
//  ReposPresenterTest.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 24/01/17.
//  Copyright © 2017 Anders Ullnæss. All rights reserved.
//

import Foundation
import XCTest
@testable import RepoMan

class ReposPresenterTest: XCTestCase {
    let reposPresenter = ReposPresenter(viewModel: ReposViewModel())
    let mockOutput = MockReposPresenterOutput()
    
    override func setUp() {
        super.setUp()
        reposPresenter.output = mockOutput
    }
    
    // MARK: Tests
    func test_fetchedRepos_callsOutputShowRepos_withViewModel() {
        let repos = [
            Repo(name: "repo1", createdAt: "2017-01-11T18:43:48Z", stargazersCount: 13, owner: "owner"),
            Repo(name: "repo2", createdAt: "2016-01-11T18:43:48Z", stargazersCount: 14, owner: "owner2"),
            Repo(name: "repo3", createdAt: "2015-01-11T18:43:48Z", stargazersCount: 15, owner: "owner3")
        ]
        let expectation1 = expectation(description: "showRepos called")
        
        reposPresenter.fetched(repos: repos)
        
        AsyncTestUtil.check(expectation1, everyMilisec: 1) { () -> Bool in
            return self.mockOutput.viewModel != nil
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }
    
    func test_failedToFetchRepos_callsShowAlertController_withFailedToGetReposErrorAlert() {
        let expectation1 = expectation(description: "showErrorAlert called")
        
        reposPresenter.failedToFetchRepos()
        
        AsyncTestUtil.check(expectation1, everyMilisec: 1) { () -> Bool in
            return self.mockOutput.alertController != nil
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
        
        XCTAssertEqual(Constants.Errors.FailedToGetRepos.title, mockOutput.alertController?.title)
        XCTAssertEqual(Constants.Errors.FailedToGetRepos.message, mockOutput.alertController?.message)
    }
}

// MARK: Mocks
class MockReposPresenterOutput: ReposPresenterOutput {
    private (set) var viewModel: ReposViewModel?
    private (set) var alertController: UIAlertController?
    
    func showRepos(viewModel: ReposViewModel) {
        self.viewModel = viewModel
    }
    
    func showErrorAlert(alertController: UIAlertController) {
        self.alertController = alertController
    }
}
