//
//  User.swift
//  tinder_dev
//
//  Created by Svitlana Moiseyenko on 6/17/18.
//  Copyright © 2018 svitlana. All rights reserved.
//

import Foundation

class User {
    
    enum Sex: String {
        case Male = "M"
        case Female = "F"
        case None
    }
    
    var name: String
    var skill: String
    var sex: Sex = .None
    
    init(name: String, sex: String, skill: String) {
        self.name = name
        self.skill = skill
        self.sex = Sex(rawValue: sex) ?? .None
    }

    func getImageName() -> String {
         return "placeholder"
    }
}
