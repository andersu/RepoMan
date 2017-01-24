//
//  UserInteractor.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 21/01/17.
//  Copyright (c) 2017 Anders Ullnæss. All rights reserved.
//

import UIKit

protocol UserInteractorOutput {
    func fetched(user: User)
    func failedToFetchUser()
    func userNotFound()
}

class UserInteractor {
    var output: UserInteractorOutput!

    var githubService: GithubService

    init(githubService: GithubService) {
        self.githubService = githubService
    }
}

extension UserInteractor: UserViewControllerOutput {
    func shouldFetchUser(username: String) {
        githubService.getUser(username: username) { user, error in
            if let user = user {
                self.output.fetched(user: user)
            } else {
                if let error = error as? HttpError, error == .notFound {
                    self.output.userNotFound()
                } else {
                    self.output.failedToFetchUser()
                }
            }
        }
    }
}
