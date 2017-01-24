//
//  AsyncTestUtil.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 24/01/17.
//  Copyright © 2017 Anders Ullnæss. All rights reserved.
//

import Foundation
import XCTest

class AsyncTestUtil {
    
    class func check(_ expectation: XCTestExpectation, everyMilisec millisec: Int, condition: @escaping () -> Bool) {
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + DispatchTimeInterval.milliseconds(millisec)) {
            if condition() {
                expectation.fulfill()
            } else {
                self.check(expectation, everyMilisec: millisec, condition: condition)
            }
        }
    }
}
