//
//  MockOtherErrorGithubService.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 24/01/17.
//  Copyright © 2017 Anders Ullnæss. All rights reserved.
//

import Foundation
@testable import RepoMan

class MockOtherErrorGithubService: GithubService {
    override func getUser(username: String, completion: @escaping (User?, Error?) -> Void) {
        completion(nil, HttpError.other)
    }
    
    override func getRepos(username: String, completion: @escaping ([Repo]?) -> Void) {
        completion(nil)
    }
}
