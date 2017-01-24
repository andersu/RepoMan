//
//  UserSearchViewModelTest.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 24/01/17.
//  Copyright © 2017 Anders Ullnæss. All rights reserved.
//

import Foundation
import XCTest
@testable import RepoMan

class UserSearchViewModelTest: XCTestCase {
    let userSearchViewModel = UserSearchViewModel()
    let searchText = "searchText"

    // MARK: Tests
    func testViewModel_withSearchTextNotNil_givesEnabledSearchButton() {
        userSearchViewModel.searchText = searchText
        
        XCTAssertTrue(userSearchViewModel.searchButtonIsEnabled)
        XCTAssertEqual(Constants.Alpha.enabled, userSearchViewModel.searchButtonAlpha)
    }
    
    func testViewModel_withSearchTextNil_givesDisabledSearchButton() {
        userSearchViewModel.searchText = nil
        
        XCTAssertFalse(userSearchViewModel.searchButtonIsEnabled)
        XCTAssertEqual(Constants.Alpha.disabled, userSearchViewModel.searchButtonAlpha)
    }
    
    func testViewModel_withEmptySearchText_givesDisabledSearchButton() {
        userSearchViewModel.searchText = ""
        
        XCTAssertFalse(userSearchViewModel.searchButtonIsEnabled)
        XCTAssertEqual(Constants.Alpha.disabled, userSearchViewModel.searchButtonAlpha)
    }
}
