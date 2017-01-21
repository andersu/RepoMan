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
    
    @IBOutlet var reposView: ReposView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ReposConfigurator.sharedInstance.configure(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reposView.delegate = self
        
        output.shouldGetRepos(username: username)
    }
}


extension ReposViewController: ReposPresenterOutput {
    func showRepos(viewModel: ReposViewModel) {
        reposView.showRepos(viewModel: viewModel)
    }
    
    func showFailedToFetchReposErrorMessage() {
        
    }
}

extension ReposViewController: ReposViewDelegate {
    func selected(repo: Repo) {
        router.goToRepoPage(repo: repo)
    }
}
