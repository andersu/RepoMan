//
//  GithubView.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 11/01/17.
//  Copyright © 2017 Anders Ullnæss. All rights reserved.
//

import Foundation
import UIKit

protocol GithubViewDelegate: class {
    func selected(repo: Repo)
}

class GithubView: NibLoadingView {
    fileprivate var repoCellIdentifier = "RepoCell"
    fileprivate var viewModel = GithubViewModel()
    
    weak var delegate: GithubViewDelegate!
    
    @IBOutlet weak var reposTableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initReposTableView()
    }
    
    func bindTo(viewModel: GithubViewModel) {
        self.viewModel = viewModel
    }
    
    private func initReposTableView() {
        reposTableView.register(RepoCell.self, forCellReuseIdentifier: repoCellIdentifier)
        
        reposTableView.estimatedRowHeight = 50
        reposTableView.rowHeight = UITableViewAutomaticDimension
        
        // To remove empty cells below content
        reposTableView.tableFooterView = UIView()
    }
}

extension GithubView: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.repos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let repo = viewModel.repos[indexPath.row]
        let repoCell = tableView.dequeueReusableCell(withIdentifier: repoCellIdentifier) as! RepoCell
        repoCell.bindTo(repo: repo)
        
        return repoCell
    }
}

extension GithubView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let repo = viewModel.repos[indexPath.row]
        delegate.selected(repo: repo)
    }
}
