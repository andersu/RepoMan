//
//  UserInteractorTest.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 24/01/17.
//  Copyright © 2017 Anders Ullnæss. All rights reserved.
//

import Foundation
import XCTest
@testable import RepoMan

class UserInteractorTest: XCTestCase {
    var userInteractor: UserInteractor!
    let mockGithubService = MockGithubService(client: HttpClient())
    let mockNotFoundGithubService = MockNotFoundGithubService(client: HttpClient())
    let mockOtherErrorGithubService = MockOtherErrorGithubService(client: HttpClient())
    let mockOutput = MockUserInteractorOutput()
    
    override func setUp() {
        super.setUp()
        userInteractor = UserInteractor(githubService: mockGithubService)
        userInteractor.output = mockOutput
    }
    
    // MARK: Tests
    func test_shouldFetchUser_callsFetchedUser_withUserFromService() {
        let username = "username"
        
        userInteractor.shouldFetchUser(username: username)
        
        XCTAssertEqual(MockGithubService.user, mockOutput.user)
    }
    
    func test_shouldFetchUser_callsUserNotFound_whenNotFoundErrorFromService() {
        userInteractor = UserInteractor(githubService: mockNotFoundGithubService)
        userInteractor.output = mockOutput
        let username = "username"
        
        userInteractor.shouldFetchUser(username: username)
        
        XCTAssertTrue(mockOutput.userNotFoundCalled)
    }
    
    func test_shouldFetchUser_callsFailedToFetchUser_whenOtherErrorFromService() {
        userInteractor = UserInteractor(githubService: mockOtherErrorGithubService)
        userInteractor.output = mockOutput
        let username = "username"
        
        userInteractor.shouldFetchUser(username: username)
        
        XCTAssertTrue(mockOutput.failedToFetchUserCalled)
    }
}

// MARK: Mocks
class MockGithubService: GithubService {
    static let user = User(username: "username", name: "name", publicRepos: 42, avatarUrl: nil)
    
    override func getUser(username: String, completion: @escaping (User?, Error?) -> Void) {
        completion(MockGithubService.user, nil)
    }
}

class MockNotFoundGithubService: GithubService {
    override func getUser(username: String, completion: @escaping (User?, Error?) -> Void) {
        completion(nil, HttpError.notFound)
    }
}

class MockOtherErrorGithubService: GithubService {
    override func getUser(username: String, completion: @escaping (User?, Error?) -> Void) {
        completion(nil, HttpError.other)
    }
}

class MockUserInteractorOutput: UserInteractorOutput {
    private (set) var user: User?
    private (set) var failedToFetchUserCalled = false
    private (set) var userNotFoundCalled = false
    
    func fetched(user: User) {
        self.user = user
    }
    
    func failedToFetchUser() {
        failedToFetchUserCalled = true
    }
    
    func userNotFound() {
        userNotFoundCalled = true
    }
}
