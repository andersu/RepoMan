//
//  RepoPresenter.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 11/01/17.
//  Copyright (c) 2017 Anders Ullnæss. All rights reserved.
//

import UIKit

protocol RepoPresenterOutput: class {
}

class RepoPresenter {

    weak var output: RepoPresenterOutput!
    var viewModel: RepoViewModel

    init(viewModel: RepoViewModel) {
        self.viewModel = viewModel
    }
}

extension RepoPresenter: RepoInteractorOutput {
}
