//
//  UserView.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 21/01/17.
//  Copyright (c) 2017 Anders Ullnæss. All rights reserved.
//

import UIKit
import Kingfisher

protocol UserViewDelegate: class {
    func seeReposButtonClicked()
}

class UserView: NibLoadingView {
    weak var delegate: UserViewDelegate!

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var publicReposLabel: UILabel!
    @IBOutlet weak var seeReposButton: UIButton!
    @IBOutlet weak var avatarImageView: UIImageView!

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

        seeReposButton.alpha = viewModel.seeReposButtonAlpha
        seeReposButton.isEnabled = viewModel.seeReposButtonIsEnabled

        if let avatarUrl = viewModel.avatarUrl {
            avatarImageView.kf.setImage(with: ImageResource(downloadURL: avatarUrl, cacheKey: viewModel.avatarCacheKey), placeholder: nil, options: nil)
        }
    }

    // Clear the dummy texts from the xib file
    private func clearTexts() {
        nameLabel.text = " "
        usernameLabel.text = " "
        publicReposLabel.text = " "
    }
}
