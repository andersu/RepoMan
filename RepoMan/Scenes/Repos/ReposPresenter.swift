//
//  ReposPresenter.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 21/01/17.
//  Copyright (c) 2017 Anders Ullnæss. All rights reserved.
//

import UIKit

protocol ReposPresenterOutput: class {
    func showRepos(viewModel: ReposViewModel)
    func showFailedToFetchReposErrorMessage()
}

class ReposPresenter {
    
    weak var output: ReposPresenterOutput!
    var viewModel: ReposViewModel
    
    init(viewModel: ReposViewModel) {
        self.viewModel = viewModel
    }
    
}

extension ReposPresenter: ReposInteractorOutput {
    func fetched(repos: [Repo]) {
        DispatchQueue.main.async {
            self.viewModel.repos = repos
            self.output.showRepos(viewModel: self.viewModel)
        }
    }
    
    func failedToFetchRepos() {
        DispatchQueue.main.async {
            self.output.showFailedToFetchReposErrorMessage()
        }
    }
}
