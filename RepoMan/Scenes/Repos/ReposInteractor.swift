//
//  ReposInteractor.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 21/01/17.
//  Copyright (c) 2017 Anders Ullnæss. All rights reserved.
//

import UIKit

protocol ReposInteractorOutput {
    func fetched(repos: [Repo])
    func failedToFetchRepos()
}

class ReposInteractor {
    
    var output: ReposInteractorOutput!
    var githubService: GithubService
    
    init(githubService: GithubService) {
        self.githubService = githubService
    }
}

extension ReposInteractor: ReposViewControllerOutput {
    func shouldGetRepos(username: String) {
        githubService.getRepos(username: username) { (repos) in
            if let repos = repos {
                self.output.fetched(repos: repos)
            } else {
                self.output.failedToFetchRepos()
            }
        }
    }

}
