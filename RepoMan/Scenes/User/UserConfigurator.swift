//
//  UserConfigurator.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 21/01/17.
//  Copyright (c) 2017 Anders Ullnæss. All rights reserved.
//

import UIKit

struct UserConfigurator {
    // MARK: Object lifecycle
    
    static let sharedInstance = UserConfigurator()
    
    private init() {
        // Enforce Singleton
    }
    
    // MARK: Configuration
    
    func configure(viewController: UserViewController) {
        let viewModel = UserViewModel()
        let presenter = UserPresenter(viewModel: viewModel)
        presenter.output = viewController
        
        let client = HttpClient()
        let githubService = GithubService(client: client)
        let interactor = UserInteractor(githubService: githubService)
        interactor.output = presenter
        
        let router = UserRouter(viewController: viewController)
        
        viewController.output = interactor
        viewController.router = router
    }
}
