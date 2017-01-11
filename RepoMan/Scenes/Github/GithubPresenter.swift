//
//  GithubPresenter.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 11/01/17.
//  Copyright (c) 2017 Anders Ullnæss. All rights reserved.
//

import UIKit

protocol GithubPresenterOutput: class {
    func showRepos(viewModel: GithubViewModel)
    func showFailedToFetchReposErrorMessage()
}

class GithubPresenter {
    
    weak var output: GithubPresenterOutput!
    var viewModel: GithubViewModel
    
    init(viewModel: GithubViewModel) {
        self.viewModel = viewModel
    }
    
}

extension GithubPresenter: GithubInteractorOutput {
    func fetched(repos: [Repo]) {
        viewModel.repos = repos
        output.showRepos(viewModel: viewModel)
    }
    
    func failedToFetchRepos() {
        output.showFailedToFetchReposErrorMessage()
    }
}
