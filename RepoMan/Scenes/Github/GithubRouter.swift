//
//  GithubRouter.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 11/01/17.
//  Copyright (c) 2017 Anders Ullnæss. All rights reserved.
//

import UIKit

protocol GithubRouterInput {
    func goToRepoPage(repo: Repo)
}

class GithubRouter: GithubRouterInput {
    
    weak var viewController: GithubViewController!
    
    init(viewController: GithubViewController) {
        self.viewController = viewController
    }
    
    func goToRepoPage(repo: Repo) {
        if let repoViewController = self.viewController.storyboard?.instantiateViewController(withIdentifier: "RepoViewController") as? RepoViewController {
            let viewModel = RepoViewModel()
            
            viewModel.repo = repo
            repoViewController.viewModel = viewModel
            
            self.viewController.navigationController?.pushViewController(repoViewController, animated: true)
        }
    }
}
