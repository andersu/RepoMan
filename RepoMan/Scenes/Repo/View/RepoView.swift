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
    
    @IBOutlet weak var repoNameLabel: UILabel!
    
    func bindTo(viewModel: RepoViewModel) {
        repoNameLabel.text = viewModel.repo?.name
    }
}
