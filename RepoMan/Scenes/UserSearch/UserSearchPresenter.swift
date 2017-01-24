//
//  UserSearchPresenter.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 21/01/17.
//  Copyright (c) 2017 Anders Ullnæss. All rights reserved.
//

import UIKit

protocol UserSearchPresenterOutput: class {
    func updateSearchButton(viewModel: UserSearchViewModel)
}

class UserSearchPresenter {

    weak var output: UserSearchPresenterOutput!
    var viewModel: UserSearchViewModel

    init(viewModel: UserSearchViewModel) {
        self.viewModel = viewModel
    }
}

extension UserSearchPresenter: UserSearchInteractorOutput {
    func searchTextChanged(newText: String?) {
        DispatchQueue.main.async {
            self.viewModel.searchText = newText
            self.output.updateSearchButton(viewModel: self.viewModel)
        }
    }
}
