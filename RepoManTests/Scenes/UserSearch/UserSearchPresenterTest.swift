//
//  UserSearchPresenterTest.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 24/01/17.
//  Copyright © 2017 Anders Ullnæss. All rights reserved.
//

import Foundation
import XCTest
@testable import RepoMan

class UserSearchPresenterTest: XCTestCase {
    let userSearchPresenter = UserSearchPresenter(viewModel: UserSearchViewModel())
    let mockOutput = MockUserSearchPresenterOutput()
    
    override func setUp() {
        super.setUp()
        userSearchPresenter.output = mockOutput
    }
    
    // MARK: Tests
    func test_searchTextChanged_withNewText_callsOutput_withViewModel() {
        let newText = "newText"
        let expectation1 = expectation(description: "updateSearchButton called")
        
        userSearchPresenter.searchTextChanged(newText: newText)
        
        AsyncTestUtil.check(expectation1, everyMilisec: 1) { () -> Bool in
            return self.mockOutput.viewModel != nil
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }
}

// MARK: Mocks
class MockUserSearchPresenterOutput: UserSearchPresenterOutput {
    private (set) var viewModel: UserSearchViewModel?
    
    func updateSearchButton(viewModel: UserSearchViewModel) {
        self.viewModel = viewModel
    }
}
