//
//  UserSearchView.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 21/01/17.
//  Copyright (c) 2017 Anders Ullnæss. All rights reserved.
//

import UIKit

protocol UserSearchViewDelegate: class {
    func searchButtonClicked(username: String)
}

class UserSearchView: NibLoadingView {
    weak var delegate: UserSearchViewDelegate!
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBAction func searchButtonClicked(_ sender: Any) {
        if let username = usernameTextField.text {
            delegate.searchButtonClicked(username: username)
        }
    }
}
