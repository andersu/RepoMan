//
//  GithubServiceTest.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 24/01/17.
//  Copyright © 2017 Anders Ullnæss. All rights reserved.
//

import Foundation
import XCTest
@testable import RepoMan

class GithubServiceTest: XCTestCase {
    var githubService: GithubService!
    let mockHttpClient = MockHttpClient()
    let mockInvalidDataHttpClient = MockInvalidDataHttpClient()
    let mockInvalidJsonHttpClient = MockInvalidJsonHttpClient()
    let mockNotFoundHttpClient = MockNotFoundHttpClient()
    let mockOtherErrorHttpClient = MockOtherErrorHttpClient()
    
    override func setUp() {
        super.setUp()
        githubService = GithubService(client: mockHttpClient)
    }
    
    // MARK: Tests
    // MARK: getUser
    func test_getUser_returnsUserWithCorrectFields_whenValidJsonFromHttpClient() {
        let username = "username"
        let expectation1 = expectation(description: "User returned")
        
        var userResult: User?
        githubService.getUser(username: username) { user, error in
            if let result = user {
                userResult = result
                expectation1.fulfill()
            }
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
        
        XCTAssertEqual(MockHttpClient.login, userResult?.username)
        XCTAssertEqual(MockHttpClient.name, userResult?.name)
        XCTAssertEqual(MockHttpClient.publicRepos, userResult?.publicRepos)
        XCTAssertEqual(MockHttpClient.avatarUrl, userResult?.avatarUrl)
    }
    
    func test_getUser_returnsOtherError_whenInvalidUserDataFromHttpClient() {
        githubService = GithubService(client: mockInvalidDataHttpClient)
        let username = "username"
        let expectation1 = expectation(description: "error returned")
        
        var errorResult: HttpError?
        githubService.getUser(username: username) { user, error in
            if let error = error as? HttpError {
                errorResult = error
                expectation1.fulfill()
            }
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
        
        XCTAssertEqual(HttpError.other, errorResult)
    }
    
    func test_getUser_returnsError_whenInvalidJsonFromHttpClient() {
        githubService = GithubService(client: mockInvalidJsonHttpClient)
        let username = "username"
        let expectation1 = expectation(description: "error returned")
        
        githubService.getUser(username: username) { user, error in
            if let _ = error {
                expectation1.fulfill()
            }
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }
    
    func test_getUser_returnsNotFoundError_whenNotFoundErrorFromHttpClient() {
        githubService = GithubService(client: mockNotFoundHttpClient)
        let username = "username"
        let expectation1 = expectation(description: "error returned")
        
        var errorResult: HttpError?
        githubService.getUser(username: username) { user, error in
            if let httpError = error as? HttpError {
                errorResult = httpError
                expectation1.fulfill()
            }
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
        
        XCTAssertEqual(HttpError.notFound, errorResult)
    }
    
    func test_getUser_returnsOtherError_whenOtherErrorFromHttpClient() {
        githubService = GithubService(client: mockOtherErrorHttpClient)
        let username = "username"
        let expectation1 = expectation(description: "error returned")
        
        var errorResult: HttpError?
        githubService.getUser(username: username) { user, error in
            if let httpError = error as? HttpError {
                errorResult = httpError
                expectation1.fulfill()
            }
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
        
        XCTAssertEqual(HttpError.other, errorResult)
    }
}

// MARK: Mocks
class MockHttpClient: HttpClient {
    static let login = "login"
    static let name = "name"
    static let publicRepos = 42
    static let avatarUrl = "https://avatarurl.com/avatar.png"
    
    static let userJson = [
        "login": login,
        "name": name,
        "public_repos": publicRepos,
        "avatar_url": avatarUrl] as [String : Any]
    
    override func get(url: URL, completion: @escaping HTTPResult) {
        let data = try! JSONSerialization.data(withJSONObject: MockHttpClient.userJson, options: .prettyPrinted)
        completion(data, nil)
    }
}

class MockInvalidDataHttpClient: HttpClient {
    static let userJson = [
        "dqwdqwdqw": "wdqwdqqw",
        "gragrw": "dwqwdqqwd",
        "ewffweafwe": "dwqwdqqwd",
        "gawawar": "dqwqwddqwdwq"] as [String : Any]
    
    override func get(url: URL, completion: @escaping HTTPResult) {
        let data = try! JSONSerialization.data(withJSONObject: MockInvalidDataHttpClient.userJson, options: .prettyPrinted)
        completion(data, nil)
    }
}

class MockInvalidJsonHttpClient: HttpClient {
    override func get(url: URL, completion: @escaping HTTPResult) {
        completion(Data(), nil)
    }
}

class MockNotFoundHttpClient: HttpClient {
    override func get(url: URL, completion: @escaping HTTPResult) {
        completion(nil, HttpError.notFound)
    }
}

class MockOtherErrorHttpClient: HttpClient {
    override func get(url: URL, completion: @escaping HTTPResult) {
        completion(nil, HttpError.other)
    }
}
