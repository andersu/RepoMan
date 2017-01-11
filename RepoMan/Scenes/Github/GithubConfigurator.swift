//
//  GithubConfigurator.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 11/01/17.
//  Copyright (c) 2017 Anders Ullnæss. All rights reserved.
//

import UIKit

struct GithubConfigurator {
    // MARK: Object lifecycle
    
    static let sharedInstance = GithubConfigurator()
    
    private init() {
        // Enforce Singleton
    }
    
    // MARK: Configuration
    
    func configure(viewController: GithubViewController) {
        let viewModel = GithubViewModel()
        let presenter = GithubPresenter(viewModel: viewModel)
        presenter.output = viewController
        
        let githubService = GithubService()
        let interactor = GithubInteractor(githubService: githubService)
        interactor.output = presenter
        
        let router = GithubRouter(viewController: viewController)
        
        viewController.output = interactor
        viewController.router = router
    }
}
