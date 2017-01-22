//
//  RepoRouter.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 11/01/17.
//  Copyright (c) 2017 Anders Ullnæss. All rights reserved.
//

import UIKit

protocol RepoRouterInput {
}

class RepoRouter: RepoRouterInput {

    weak var viewController: RepoViewController!

    init(viewController: RepoViewController) {
        self.viewController = viewController
    }
}
