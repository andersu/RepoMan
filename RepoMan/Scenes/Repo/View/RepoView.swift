//
//  RepoView.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 11/01/17.
//  Copyright © 2017 Anders Ullnæss. All rights reserved.
//

import Foundation
import UIKit

class RepoView: NibLoadingView {

    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var createdLabel: UILabel!
    @IBOutlet weak var stargazersLabel: UILabel!

    func bindTo(viewModel: RepoViewModel) {
        ownerLabel.text = viewModel.ownerLabelText
        createdLabel.text = viewModel.createdLabelText
        stargazersLabel.text = viewModel.stargazersLabelText
    }
}
