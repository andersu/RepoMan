//
//  RepoConfigurator.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 11/01/17.
//  Copyright (c) 2017 Anders Ullnæss. All rights reserved.
//

import UIKit

struct RepoConfigurator {
    // MARK: Object lifecycle
    
    static let sharedInstance = RepoConfigurator()
    
    private init() {
        // Enforce Singleton
    }
    
    // MARK: Configuration
    
    func configure(viewController: RepoViewController) {
        let viewModel = RepoViewModel()
        let presenter = RepoPresenter(viewModel: viewModel)
        presenter.output = viewController
        
        let interactor = RepoInteractor()
        interactor.output = presenter
        
        let router = RepoRouter(viewController: viewController)
        
        viewController.output = interactor
        viewController.router = router
    }
}
