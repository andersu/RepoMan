//
//  UserSearchViewController.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 21/01/17.
//  Copyright (c) 2017 Anders Ullnæss. All rights reserved.
//

import UIKit

protocol UserSearchViewControllerOutput {
    func searchTextChanged(newText: String?)
}

class UserSearchViewController: UIViewController {

    var output: UserSearchViewControllerOutput!
    var router: UserSearchRouter!
    @IBOutlet var userSearchView: UserSearchView! // TODO: rename and hook this up with view in storyboard

    override func awakeFromNib() {
        super.awakeFromNib()
        UserSearchConfigurator.sharedInstance.configure(viewController: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        userSearchView.delegate = self
    }
}

extension UserSearchViewController: UserSearchPresenterOutput {
    func updateSearchButton(viewModel: UserSearchViewModel) {
        userSearchView.updateSearchButton(viewModel: viewModel)
    }
}

extension UserSearchViewController: UserSearchViewDelegate {
    internal func searchTextChanged(newText: String?) {
        output.searchTextChanged(newText: newText)
    }

    func searchButtonClicked(username: String) {
        router.goToUser(username: username)
    }
}
