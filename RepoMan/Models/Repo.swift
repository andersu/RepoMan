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
    
    init(name: String) {
        self.name = name
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
        if let name = json["name"] as? String {
            return Repo(name: name)
        }
        
        Logger.printDebug(tag: logTag, "Unable to parse Repo from json")
        return nil
    }
}
