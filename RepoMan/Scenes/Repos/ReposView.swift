//
//  ReposView.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 21/01/17.
//  Copyright (c) 2017 Anders Ullnæss. All rights reserved.
//

import UIKit

protocol ReposViewDelegate: class {
    func selected(repo: Repo)
}

class ReposView: NibLoadingView {
    fileprivate var repoCellIdentifier = "RepoCell"
    fileprivate var viewModel = ReposViewModel()
    
    weak var delegate: ReposViewDelegate!
    
    @IBOutlet weak var reposTableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initReposTableView()
    }
    
    func showRepos(viewModel: ReposViewModel) {
        self.viewModel = viewModel
        reposTableView.reloadData()
    }
    
    private func initReposTableView() {
        reposTableView.register(RepoCell.self, forCellReuseIdentifier: repoCellIdentifier)
        
        reposTableView.estimatedRowHeight = 50
        reposTableView.rowHeight = UITableViewAutomaticDimension
        
        // To remove empty cells below content
        reposTableView.tableFooterView = UIView()
    }
}

extension ReposView: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.repos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let repo = viewModel.repos[indexPath.row]
        let repoCell = tableView.dequeueReusableCell(withIdentifier: repoCellIdentifier) as! RepoCell
        repoCell.bindTo(repo: repo)
        
        repoCell.selectionStyle = .none;
        
        return repoCell
    }
}

extension ReposView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let repo = viewModel.repos[indexPath.row]
        delegate.selected(repo: repo)
    }
}
