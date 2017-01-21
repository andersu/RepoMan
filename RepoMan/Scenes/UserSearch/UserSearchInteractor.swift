//
//  UserSearchInteractor.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 21/01/17.
//  Copyright (c) 2017 Anders Ullnæss. All rights reserved.
//

import UIKit

protocol UserSearchInteractorOutput {

}

class UserSearchInteractor {
    var output: UserSearchInteractorOutput!
}

extension UserSearchInteractor: UserSearchViewControllerOutput {

}
