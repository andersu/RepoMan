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
}
