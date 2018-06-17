//
//  Utils.swift
//  tinder_dev
//
//  Created by Svitlana Moiseyenko on 6/17/18.
//  Copyright © 2018 svitlana. All rights reserved.
//

import Foundation

final class Utils {
    
    class func getRandom(max: Int) -> Int {
        return Int(arc4random_uniform(UInt32(max)) + 1)
    }
}
