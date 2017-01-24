//
//  LoadingViewController.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 24/01/17.
//  Copyright © 2017 Anders Ullnæss. All rights reserved.
//

import Foundation
import UIKit

class LoadingViewController: UIViewController {

    @IBOutlet weak var loadingView: LoadingView!

    // Set by router
    var text: String!

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadingView.setText(text: text)
    }
}
