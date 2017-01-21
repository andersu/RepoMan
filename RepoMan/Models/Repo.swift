//
//  Repo.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 11/01/17.
//  Copyright © 2017 Anders Ullnæss. All rights reserved.
//

import Foundation

class Repo {
    private static let logTag = String(describing: Repo.self)
    
    var name: String
    var owner: String
    var createdAt: String
    var stargazersCount: Int
    
    init(name: String, createdAt: String, stargazersCount: Int, owner: String) {
        self.name = name
        self.createdAt = createdAt
        self.stargazersCount = stargazersCount
        self.owner = owner
    }
    
    class func from(jsonArray: [[String: Any]]) -> [Repo] {
        var repos: [Repo] = []
        
        for jsonDict in jsonArray {
            if let repo = from(json: jsonDict) {
                repos.append(repo)
            }
        }
        
        return repos
    }
    
    class func from(json: [String: Any]) -> Repo? {
        if let name = json["name"] as? String,
            let createdAt = json["created_at"] as? String,
            let stargazersCount = json["stargazers_count"] as? Int,
            let ownerDict = json["owner"] as? [String: Any],
            let owner = ownerDict["login"] as? String
        {
            return Repo(name: name, createdAt: createdAt, stargazersCount: stargazersCount, owner: owner)
        }
        
        Logger.printDebug(tag: logTag, "Unable to parse Repo from json")
        return nil
    }
}
