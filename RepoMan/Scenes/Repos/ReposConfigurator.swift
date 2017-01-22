//
//  ReposConfigurator.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 21/01/17.
//  Copyright (c) 2017 Anders Ullnæss. All rights reserved.
//

import UIKit

struct ReposConfigurator {
    // MARK: Object lifecycle

    static let sharedInstance = ReposConfigurator()

    private init() {
        // Enforce Singleton
    }

    // MARK: Configuration

    func configure(viewController: ReposViewController) {
        let viewModel = ReposViewModel()
        let presenter = ReposPresenter(viewModel: viewModel)
        presenter.output = viewController

        let client = HttpClient()
        let githubService = GithubService(client: client)
        let interactor = ReposInteractor(githubService: githubService)
        interactor.output = presenter

        let router = ReposRouter(viewController: viewController)

        viewController.output = interactor
        viewController.router = router
    }
}
