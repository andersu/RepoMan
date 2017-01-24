//
//  UserRouter.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 21/01/17.
//  Copyright (c) 2017 Anders Ullnæss. All rights reserved.
//

import UIKit

protocol UserRouterInput {
}

class UserRouter: UserRouterInput, Loading {
    typealias T = UserViewController
    weak var viewController: UserViewController!

    init(viewController: UserViewController) {
        self.viewController = viewController
    }

    func goToRepos(username: String) {
        if let reposViewController = viewController.storyboard?.instantiateViewController(withIdentifier: "ReposViewController") as? ReposViewController {
            reposViewController.username = username
            viewController.navigationController?.pushViewController(reposViewController, animated: true)
        }
    }
}
