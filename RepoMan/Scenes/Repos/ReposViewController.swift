//
//  ReposViewController.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 21/01/17.
//  Copyright (c) 2017 Anders Ullnæss. All rights reserved.
//

import UIKit

protocol ReposViewControllerOutput {
    func shouldGetRepos(username: String)
}

class ReposViewController: UIViewController {

    var output: ReposViewControllerOutput!
    var router: ReposRouter!

    var username: String! // Is set by router of previous scene
    var shouldFetchRepos = true

    @IBOutlet var reposView: ReposView!

    override func awakeFromNib() {
        super.awakeFromNib()
        ReposConfigurator.sharedInstance.configure(viewController: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        reposView.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // Only fetch user the first time the view appears
        if shouldFetchRepos {
            fetchRepos()
            shouldFetchRepos = false
        }
    }

    private func fetchRepos() {
        router.showLoadingView(text: Constants.LoadingTexts.fetchRepos) {
            self.output.shouldGetRepos(username: self.username)
        }
    }
}

extension ReposViewController: ReposPresenterOutput {
    func showRepos(viewModel: ReposViewModel) {
        router.hideLoadingView {
            self.reposView.showRepos(viewModel: viewModel)
        }
    }

    func showErrorAlert(alertController: UIAlertController) {
        router.hideLoadingView {
            self.present(alertController, animated: false)
        }
    }
}

extension ReposViewController: ReposViewDelegate {
    func selected(repo: Repo) {
        router.goToRepoPage(repo: repo)
    }
}
