//
//  UserSearchRouter.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 21/01/17.
//  Copyright (c) 2017 Anders Ullnæss. All rights reserved.
//

import UIKit

protocol UserSearchRouterInput {
    func goToUser(username: String)
}

class UserSearchRouter: UserSearchRouterInput {

    weak var viewController: UserSearchViewController!

    init(viewController: UserSearchViewController) {
        self.viewController = viewController
    }

    func goToUser(username: String) {
        if let userViewController = viewController.storyboard?.instantiateViewController(withIdentifier: "UserViewController") as? UserViewController {
            userViewController.username = username
            viewController.navigationController?.pushViewController(userViewController, animated: true)
        }
    }
}
