//
//  Logger.swift
//  RepoMan
//
//  Created by Anders Ullnæss on 21/01/17.
//  Copyright © 2017 Anders Ullnæss. All rights reserved.
//

import Foundation

class Logger {
    class func printDebug(tag: String, _ items: Any...) {
        #if DEBUG
            print("\(tag): ", items)
        #endif
    }
}
