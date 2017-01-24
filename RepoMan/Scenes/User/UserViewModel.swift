//
//  UserViewModel.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 21/01/17.
//  Copyright (c) 2017 Anders Ullnæss. All rights reserved.
//

import UIKit

class UserViewModel {
    var user: User?

    var title: String? {
        return user?.username
    }

    var usernameLabelText: String? {
        return user?.username
    }

    var nameLabelText: String? {
        return user?.name
    }

    var publicReposLabelText: String? {
        if let user = user {
            return "\(user.publicRepos)"
        }

        return nil
    }

    var seeReposButtonAlpha: CGFloat {
        if let _ = user {
            return Constants.Alpha.enabled
        }

        return Constants.Alpha.disabled
    }

    var seeReposButtonIsEnabled: Bool {
        return user != nil
    }
}
