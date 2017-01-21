//
//  UserSearchPresenter.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 21/01/17.
//  Copyright (c) 2017 Anders Ullnæss. All rights reserved.
//

import UIKit

protocol UserSearchPresenterOutput: class {
    
}

class UserSearchPresenter {
    
    weak var output: UserSearchPresenterOutput!
    var viewModel: UserSearchViewModel
    
    init(viewModel: UserSearchViewModel) {
        self.viewModel = viewModel
    }
    
}

extension UserSearchPresenter: UserSearchInteractorOutput {
    func fetched(user: User) {
        
    }
    
    func failedToFetchUser() {
        
    }
}
