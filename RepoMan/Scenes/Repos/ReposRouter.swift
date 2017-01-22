//
//  ReposRouter.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 21/01/17.
//  Copyright (c) 2017 Anders Ullnæss. All rights reserved.
//

import UIKit

protocol ReposRouterInput {
}

class ReposRouter: ReposRouterInput {

    weak var viewController: ReposViewController!

    init(viewController: ReposViewController) {
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
