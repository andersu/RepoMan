//
//  UserViewController.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 21/01/17.
//  Copyright (c) 2017 Anders Ullnæss. All rights reserved.
//

import UIKit

protocol UserViewControllerOutput {
    func shouldFetchUser(username: String)
}

class UserViewController: UIViewController {
    var output: UserViewControllerOutput!
    var router: UserRouter!

    @IBOutlet var userView: UserView!

    var username: String! // Is set by router of previous scene
    var shouldFetchUser = true

    override func awakeFromNib() {
        super.awakeFromNib()
        UserConfigurator.sharedInstance.configure(viewController: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        userView.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Only fetch user the first time the view appears
        if shouldFetchUser {
            fetchUser()
            shouldFetchUser = false
        }
    }

    private func fetchUser() {
        router.showLoadingView(text: Constants.LoadingTexts.fetchUser) {
            self.output.shouldFetchUser(username: self.username)
        }
    }
}

extension UserViewController: UserPresenterOutput {
    func present(viewModel: UserViewModel) {
        router.hideLoadingView {
            self.navigationItem.title = viewModel.title
            self.userView.present(viewModel: viewModel)
        }
    }

    func showErrorAlert(alertController: UIAlertController) {
        router.hideLoadingView {
            self.present(alertController, animated: false)
        }
    }
}

extension UserViewController: UserViewDelegate {
    func seeReposButtonClicked() {
        router.goToRepos(username: username)
    }
}
