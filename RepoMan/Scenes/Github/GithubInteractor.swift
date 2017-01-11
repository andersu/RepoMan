//
//  GithubInteractor.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 11/01/17.
//  Copyright (c) 2017 Anders Ullnæss. All rights reserved.
//

import UIKit

protocol GithubInteractorOutput {
    func fetched(repos: [Repo])
    func failedToFetchRepos()
}

class GithubInteractor {
    
    var output: GithubInteractorOutput!
    var githubService: GithubService
    
    init(githubService: GithubService) {
        self.githubService = githubService
    }
    
    // MARK: Business logic
    
}

extension GithubInteractor: GithubViewControllerOutput {
    func shouldGetRepos() {
        githubService.getRepos() { (repos) in
            if let repos = repos {
                self.output.fetched(repos: repos)
            } else {
                self.output.failedToFetchRepos()
            }
        }
    }
}
