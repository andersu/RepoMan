//
//  UserPresenter.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 21/01/17.
//  Copyright (c) 2017 Anders Ullnæss. All rights reserved.
//

import UIKit

protocol UserPresenterOutput: class {
    func present(viewModel: UserViewModel)
    func showFailedToFetchUserErrorMessage()
}

class UserPresenter {
    
    weak var output: UserPresenterOutput!
    var viewModel: UserViewModel
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
    }
}

extension UserPresenter: UserInteractorOutput {
    func fetched(user: User) {
        DispatchQueue.main.async {
            self.viewModel.user = user
            self.output.present(viewModel: self.viewModel)
        }
    }
    
    func failedToFetchUser() {
        DispatchQueue.main.async {
            self.output.showFailedToFetchUserErrorMessage()
        }
    }
}
