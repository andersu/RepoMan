//
//  UserSearchViewModel.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 21/01/17.
//  Copyright (c) 2017 Anders Ullnæss. All rights reserved.
//

import UIKit

class UserSearchViewModel {
    var searchText: String?

    var searchButtonIsEnabled: Bool {
        guard let searchText = searchText else {
            return false
        }

        return !searchText.isEmpty
    }

    var searchButtonAlpha: CGFloat {
        guard let searchText = searchText else {
            return Constants.Alpha.disabled
        }

        if searchText.isEmpty {
            return Constants.Alpha.disabled
        }

        return Constants.Alpha.enabled
    }
}
