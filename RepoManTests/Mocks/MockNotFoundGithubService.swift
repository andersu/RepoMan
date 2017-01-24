//
//  MockNotFoundGithubService.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 24/01/17.
//  Copyright © 2017 Anders Ullnæss. All rights reserved.
//

import Foundation
@testable import RepoMan

class MockNotFoundGithubService: GithubService {
    override func getUser(username: String, completion: @escaping (User?, Error?) -> Void) {
        completion(nil, HttpError.notFound)
    }
}
