//
//  User.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 21/01/17.
//  Copyright © 2017 Anders Ullnæss. All rights reserved.
//

import Foundation

func == (lhs: User, rhs: User) -> Bool {
    return lhs.username == rhs.username
        && lhs.name == rhs.name
        && lhs.publicRepos == rhs.publicRepos
        && lhs.avatarUrl == rhs.avatarUrl
}

class User: Equatable {
    private static let logTag = String(describing: User.self)

    var username: String
    var name: String
    var publicRepos: Int
    var avatarUrl: String?

    init(username: String, name: String, publicRepos: Int, avatarUrl: String?) {
        self.username = username
        self.name = name
        self.publicRepos = publicRepos
        self.avatarUrl = avatarUrl
    }

    class func from(json: [String: Any]) -> User? {
        if let username = json["login"] as? String,
            let name = json["name"] as? String,
            let publicRepos = json["public_repos"] as? Int {

            let avatarUrl = json["avatar_url"] as? String

            return User(username: username, name: name, publicRepos: publicRepos, avatarUrl: avatarUrl)
        }

        Logger.printDebug(tag: logTag, "Unable to parse User from json")
        return nil
    }
}
