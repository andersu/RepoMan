//
//  GithubService.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 11/01/17.
//  Copyright © 2017 Anders Ullnæss. All rights reserved.
//

import Foundation

class GithubService {
    
    // Hard coded for the example's sake. Would normally call an api.
    func getRepos(completion: @escaping ([Repo]?) -> Void) {
        let random = Int(arc4random_uniform(1)) // returns 0 or 1
        if random == 0 {
            completion([Repo(name: "RepoMan"), Repo(name: "CoolProject"), Repo(name: "Calculator")])
        } else {
            completion(nil)
        }
    }
}
