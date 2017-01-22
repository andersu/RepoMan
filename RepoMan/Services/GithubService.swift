//
//  GithubService.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 11/01/17.
//  Copyright © 2017 Anders Ullnæss. All rights reserved.
//

import Foundation

class GithubService {
    private let logTag = String(describing: GithubService.self)
    private var client: HttpClient

    init(client: HttpClient) {
        self.client = client
    }

    func getUser(username: String, completion: @escaping (User?) -> Void) {
        client.get(url: Constants.Api.getUserUrl(username: username)) { data, error in
            var user: User?

            if let data = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String: Any] {
                        user = User.from(json: json)
                    }
                } catch {
                    Logger.printDebug(tag: self.logTag, error.localizedDescription)
                }
            }

            if let error = error {
                Logger.printDebug(tag: self.logTag, error.localizedDescription)
            }

            completion(user)
        }
    }

    func getRepos(username: String, completion: @escaping ([Repo]?) -> Void) {
        client.get(url: Constants.Api.getReposUrl(username: username)) { data, error in
            var repos: [Repo]?

            if let data = data {
                do {
                    if let jsonArray = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [[String: Any]] {
                        repos = Repo.from(jsonArray: jsonArray)
                    }
                } catch {
                    Logger.printDebug(tag: self.logTag, error.localizedDescription)
                }
            }

            if let error = error {
                Logger.printDebug(tag: self.logTag, error.localizedDescription)
            }

            completion(repos)
        }
    }
}
