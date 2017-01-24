//
//  LoadingView.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 24/01/17.
//  Copyright © 2017 Anders Ullnæss. All rights reserved.
//

import Foundation
import UIKit

class LoadingView: NibLoadingView {

    @IBOutlet weak var loadingTextLabel: UILabel!

    func setText(text: String) {
        loadingTextLabel.text = text
    }
}
