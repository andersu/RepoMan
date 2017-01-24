//
//  UserSearchView.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 21/01/17.
//  Copyright (c) 2017 Anders Ullnæss. All rights reserved.
//

import UIKit

protocol UserSearchViewDelegate: class {
    func searchTextChanged(newText: String?)
    func searchButtonClicked(username: String)
}

class UserSearchView: NibLoadingView {
    weak var delegate: UserSearchViewDelegate!

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!

    @IBAction func searchButtonClicked(_: Any) {
        if let username = usernameTextField.text {
            delegate.searchButtonClicked(username: username)
        }
    }

    func updateSearchButton(viewModel: UserSearchViewModel) {
        searchButton.isEnabled = viewModel.searchButtonIsEnabled
        searchButton.alpha = viewModel.searchButtonAlpha
    }
}

extension UserSearchView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        if let text = textField.text {
            let newText = (text as NSString).replacingCharacters(in: range, with: string)
            delegate.searchTextChanged(newText: newText)
        } else {
            delegate.searchTextChanged(newText: nil)
        }

        return true
    }
}
