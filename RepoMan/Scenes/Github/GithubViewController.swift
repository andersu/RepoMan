//
//  GithubViewController.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 11/01/17.
//  Copyright (c) 2017 Anders Ullnæss. All rights reserved.
//

import UIKit

protocol GithubViewControllerOutput {
    func shouldGetRepos()
}

class GithubViewController: UIViewController {
    
    var output: GithubViewControllerOutput!
    var router: GithubRouter!
    
    @IBOutlet weak var githubView: GithubView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        GithubConfigurator.sharedInstance.configure(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        githubView.delegate = self
        
        output.shouldGetRepos()
    }
}


extension GithubViewController: GithubPresenterOutput {
    func showRepos(viewModel: GithubViewModel) {
        githubView.bindTo(viewModel: viewModel)
    }
    
    func showFailedToFetchReposErrorMessage() {
        
    }
}

extension GithubViewController: GithubViewDelegate {
    func selected(repo: Repo) {
        router.goToRepoPage(repo: repo)
    }
}
