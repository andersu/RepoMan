//
//  RepoCell.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 11/01/17.
//  Copyright © 2017 Anders Ullnæss. All rights reserved.
//

import Foundation
import UIKit

class RepoCell: NibDesignableTableViewCell {
    @IBOutlet weak var repoNameLabel: UILabel!
    
    func bindTo(repo: Repo) {
        repoNameLabel.text = repo.name
    }
}
