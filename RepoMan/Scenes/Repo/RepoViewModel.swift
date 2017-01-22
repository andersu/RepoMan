//
//  RepoViewModel.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 11/01/17.
//  Copyright (c) 2017 Anders Ullnæss. All rights reserved.
//

import UIKit

class RepoViewModel {
    var repo: Repo?

    var ownerLabelText: String? {
        return repo?.owner
    }

    var createdLabelText: String? {
        if let createdAt = repo?.createdAt {
            let date = createdAt.dateFromISO8601
            let formattedDate = date?.dayMonthYearFormat
            return formattedDate
        }

        return nil
    }

    var stargazersLabelText: String? {
        if let stargazerCount = repo?.stargazersCount {
            return "\(stargazerCount)"
        }

        return nil
    }

    var title: String? {
        return repo?.name
    }
}
