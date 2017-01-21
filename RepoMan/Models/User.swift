//
//  User.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 21/01/17.
//  Copyright © 2017 Anders Ullnæss. All rights reserved.
//

import Foundation

class User {
    private static let logTag = String(describing: User.self)
    
    var username: String
    var name: String
    var publicRepos: Int
    
    init(username: String, name: String, publicRepos: Int) {
        self.username = username
        self.name = name
        self.publicRepos = publicRepos
    }
    
    class func from(json: [String: Any]) -> User? {
        if let username = json["login"] as? String,
            let name = json["name"] as? String,
            let publicRepos = json["public_repos"] as? Int
        {
            return User(username: username, name: name, publicRepos: publicRepos)
        }
        
        Logger.printDebug(tag: logTag, "Unable to parse User from json")
        return nil
    }
}
