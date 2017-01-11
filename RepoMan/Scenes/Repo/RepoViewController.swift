//
//  RepoViewController.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 11/01/17.
//  Copyright (c) 2017 Anders Ullnæss. All rights reserved.
//

import UIKit

protocol RepoViewControllerOutput {
    
}

class RepoViewController: UIViewController {
    
    var output: RepoViewControllerOutput!
    var router: RepoRouter!
    var viewModel: RepoViewModel!
    
    @IBOutlet weak var repoView: RepoView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        RepoConfigurator.sharedInstance.configure(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        repoView.bindTo(viewModel: viewModel)
    }
}


extension RepoViewController: RepoPresenterOutput {
    
}
