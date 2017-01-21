//
//  UserSearchConfigurator.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 21/01/17.
//  Copyright (c) 2017 Anders Ullnæss. All rights reserved.
//

import UIKit

struct UserSearchConfigurator {
    // MARK: Object lifecycle
    
    static let sharedInstance = UserSearchConfigurator()
    
    private init() {
        // Enforce Singleton
    }
    
    // MARK: Configuration
    
    func configure(viewController: UserSearchViewController) {
        let viewModel = UserSearchViewModel()
        let presenter = UserSearchPresenter(viewModel: viewModel)
        presenter.output = viewController
        
        let interactor = UserSearchInteractor()
        interactor.output = presenter
        
        let router = UserSearchRouter(viewController: viewController)
        
        viewController.output = interactor
        viewController.router = router
    }
}
