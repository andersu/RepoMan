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
    
    @IBOutlet var userView: UserView! // TODO: hook this up with view in storyboard
    
    var username: String! // Is set by router of previous scene
    
    override func awakeFromNib() {
        super.awakeFromNib()
        UserConfigurator.sharedInstance.configure(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.shouldFetchUser(username: username)
        
        userView.delegate = self
    }
}


extension UserViewController: UserPresenterOutput {
    func present(viewModel: UserViewModel) {
        navigationItem.title = viewModel.title
        userView.present(viewModel: viewModel)
    }
    
    func showFailedToFetchUserErrorMessage() {
        // TODO
    }
}

extension UserViewController: UserViewDelegate {
    func seeReposButtonClicked() {
        router.goToRepos(username: username)
    }
}
