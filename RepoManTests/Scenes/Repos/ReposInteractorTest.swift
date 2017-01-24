//
//  ReposInteractorTest.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 24/01/17.
//  Copyright © 2017 Anders Ullnæss. All rights reserved.
//

import Foundation
import XCTest
@testable import RepoMan

class ReposInteractorTest: XCTestCase {
    var reposInteractor: ReposInteractor!
    let mockGithubService = MockGithubService(client: HttpClient())
    let mockOtherErrorGithubService = MockOtherErrorGithubService(client: HttpClient())
    let mockOutput = MockReposInteractorOutput()
    
    override func setUp() {
        super.setUp()
        reposInteractor = ReposInteractor(githubService: mockGithubService)
        reposInteractor.output = mockOutput
    }
    
    // MARK: Tests
    func test_shouldGetRepos_callsOutputFetched_withReposFromService() {
        let username = "username"
        
        reposInteractor.shouldGetRepos(username: username)
        
        XCTAssertEqual(MockGithubService.repos, mockOutput.repos!)
    }
    
    func test_shouldGetRepos_callsOutputFailedToFetchRepos_withNilFromService() {
        reposInteractor = ReposInteractor(githubService: mockOtherErrorGithubService)
        reposInteractor.output = mockOutput
        let username = "username"
        
        reposInteractor.shouldGetRepos(username: username)
        
        XCTAssertTrue(mockOutput.failedToFetchReposCalled)
    }
}

// MARK: Mocks
class MockReposInteractorOutput: ReposInteractorOutput {
    private (set) var repos: [Repo]?
    private (set) var failedToFetchReposCalled = false
    
    func fetched(repos: [Repo]) {
        self.repos = repos
    }
    
    func failedToFetchRepos() {
        self.failedToFetchReposCalled = true
    }
}
