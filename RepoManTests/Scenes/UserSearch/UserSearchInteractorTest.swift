//
//  UserSearchInteractorTest.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 24/01/17.
//  Copyright © 2017 Anders Ullnæss. All rights reserved.
//

import Foundation
import XCTest
@testable import RepoMan

class UserSearchInteractorTest: XCTestCase {
    let userSearchInteractor = UserSearchInteractor()
    let mockOutput = MockUserSearchInteractorOutput()
    
    override func setUp() {
        super.setUp()
        userSearchInteractor.output = mockOutput
    }
    
    // MARK: Tests
    func test_searchTextChanged_withNewText_callsOutput_withNewText() {
        let newText = "newText"
        userSearchInteractor.searchTextChanged(newText: newText)
        
        XCTAssertEqual(newText, mockOutput.newText)
    }
}

// MARK: Mocks
class MockUserSearchInteractorOutput: UserSearchInteractorOutput {
    private (set) var newText: String?
    
    func searchTextChanged(newText: String?) {
        self.newText = newText
    }
}
