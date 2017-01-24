//
//  UserViewModelTest.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 24/01/17.
//  Copyright © 2017 Anders Ullnæss. All rights reserved.
//

import Foundation
import XCTest
@testable import RepoMan

class UserViewModelTest: XCTestCase {
    let userViewModel = UserViewModel()
    let username = "username"
    let nameText = "name"
    let publicRepos = 42
    let avatarUrl = "https://avatarurl.com/avatar.png"
    
    var user: User!
    
    override func setUp() {
        super.setUp()
        user = User(username: username, name: nameText, publicRepos: publicRepos, avatarUrl: avatarUrl)
    }
    
    // MARK: Tests
    func testViewModel_withUserNotNil_givesCorrectValues() {
        userViewModel.user = user
        
        XCTAssertEqual(username, userViewModel.title)
        XCTAssertEqual(username, userViewModel.usernameLabelText)
        XCTAssertEqual(nameText, userViewModel.nameLabelText)
        XCTAssertEqual("\(publicRepos)", userViewModel.publicReposLabelText)
        XCTAssertEqual(Constants.Alpha.enabled, userViewModel.seeReposButtonAlpha)
        XCTAssertTrue(userViewModel.seeReposButtonIsEnabled)
        XCTAssertEqual(URL(string: avatarUrl), userViewModel.avatarUrl)
        XCTAssertEqual(avatarUrl, userViewModel.avatarCacheKey)
    }
    
    func testViewModel_withUserNil_givesCorrectValues() {
        userViewModel.user = nil
        
        XCTAssertEqual(nil, userViewModel.title)
        XCTAssertEqual(nil, userViewModel.usernameLabelText)
        XCTAssertEqual(nil, userViewModel.nameLabelText)
        XCTAssertEqual(nil, userViewModel.publicReposLabelText)
        XCTAssertEqual(Constants.Alpha.disabled, userViewModel.seeReposButtonAlpha)
        XCTAssertFalse(userViewModel.seeReposButtonIsEnabled)
        XCTAssertEqual(nil, userViewModel.avatarUrl)
        XCTAssertEqual(nil, userViewModel.avatarCacheKey)
    }
}
