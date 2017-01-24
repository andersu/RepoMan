//
//  MockGithubService.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 24/01/17.
//  Copyright © 2017 Anders Ullnæss. All rights reserved.
//

import Foundation
@testable import RepoMan

class MockGithubService: GithubService {
    static let user = User(username: "username", name: "name", publicRepos: 42, avatarUrl: nil)
    static let repos = [
        Repo(name: "repo1", createdAt: "2017-01-11T18:43:48Z", stargazersCount: 13, owner: "owner"),
        Repo(name: "repo2", createdAt: "2016-01-11T18:43:48Z", stargazersCount: 14, owner: "owner2"),
        Repo(name: "repo3", createdAt: "2015-01-11T18:43:48Z", stargazersCount: 15, owner: "owner3")
    ]
    
    override func getUser(username: String, completion: @escaping (User?, Error?) -> Void) {
        completion(MockGithubService.user, nil)
    }
    
    override func getRepos(username: String, completion: @escaping ([Repo]?) -> Void) {
        completion(MockGithubService.repos)
    }
}
