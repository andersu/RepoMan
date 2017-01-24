//
//  UserView.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 21/01/17.
//  Copyright (c) 2017 Anders Ullnæss. All rights reserved.
//

import UIKit

protocol UserViewDelegate: class {
    func seeReposButtonClicked()
}

class UserView: NibLoadingView {
    weak var delegate: UserViewDelegate!

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var publicReposLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        clearTexts()
    }

    @IBAction func seeReposButtonClicked(_: Any) {
        delegate.seeReposButtonClicked()
    }

    func present(viewModel: UserViewModel) {
        nameLabel.text = viewModel.nameLabelText
        usernameLabel.text = viewModel.usernameLabelText
        publicReposLabel.text = viewModel.publicReposLabelText
    }

    // Clear the dummy texts from the xib file
    private func clearTexts() {
        nameLabel.text = nil
        usernameLabel.text = nil
        publicReposLabel.text = nil
    }
}
