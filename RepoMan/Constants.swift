//
//  Constants.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 21/01/17.
//  Copyright © 2017 Anders Ullnæss. All rights reserved.
//

import Foundation
import UIKit

enum Constants {
    struct HttpMethods {
        static let get = "GET"
    }

    struct Api {
        static let baseUrl = "https://api.github.com"

        static func getUserUrl(username: String) -> URL {
            return URL(string: "\(baseUrl)/users/\(username)")!
        }

        static func getReposUrl(username: String) -> URL {
            return URL(string: "\(baseUrl)/users/\(username)/repos")!
        }
    }

    struct Alpha {
        static let disabled: CGFloat = 0.5
        static let enabled: CGFloat = 1.0
    }

    struct Errors {
        struct Default {
            static let title = "Something went wrong"
            static let message = "Check your network connection and try again."
        }

        struct FailedToGetUser {
            static let title = "Failed to get user"
            static let message = Default.message
        }

        struct UserNotFound {
            static let title = "User not found"
            static let message = "Check for typos in your search and try again."
        }

        struct FailedToGetRepos {
            static let title = "Failed to get repos"
            static let message = Default.message
        }
    }

    struct LoadingTexts {
        static let fetchUser = "Fetching user"
        static let fetchRepos = "Fetching repos"
    }
}
