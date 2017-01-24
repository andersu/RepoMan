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
    func showErrorAlert(alertController: UIAlertController)
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
            let error = Constants.Errors.FailedToGetUser.self
            let errorAlert = ErrorAlertCreator.create(title: error.title, message: error.message)

            self.output.showErrorAlert(alertController: errorAlert)
        }
    }

    func userNotFound() {
        DispatchQueue.main.async {
            let error = Constants.Errors.UserNotFound.self
            let errorAlert = ErrorAlertCreator.create(title: error.title, message: error.message)

            self.output.showErrorAlert(alertController: errorAlert)
        }
    }
}
