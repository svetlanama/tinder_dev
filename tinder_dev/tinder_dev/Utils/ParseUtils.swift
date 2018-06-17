//
//  ParseUtils.swift
//  tinder_dev
//
//  Created by Svitlana Moiseyenko on 6/17/18.
//  Copyright © 2018 svitlana. All rights reserved.
//

import Foundation
import CSV

final class ParseUtils {
    
    static let bundle = Bundle.main
    
    /// Parse data
    ///
    /// - Parameter fileName: csv
    /// - Returns: array of users
    class func parseUsers(fileName: String) -> [User] {
        var users = [User]()
        
        guard let filepath = getFilePath(fileName: fileName) else {
            return users
        }
        
        let stream = InputStream(fileAtPath: filepath)
        let csv = try! CSVReader(stream: stream!,
                                 codecType: UTF8.self)
        
        while let row = csv.next() {
            if let name = row[UserColumn.kName.hashValue] as? String, name != UserColumn.kName.rawValue,
                let sex = row[UserColumn.kSex.hashValue] as? String, sex != UserColumn.kSex.rawValue,
                let skill = row[UserColumn.kSkill.hashValue] as? String, skill != UserColumn.kSkill.rawValue {
                
                let user = User(name: name, sex: sex, skill: skill)
                users.append(user)
            }
        }
        
        return users
    }
    
    
    /// Get path
    ///
    /// - Parameter fileName: file name
    /// - Returns: path
    class func getFilePath(fileName: String) -> String? {
        guard let filepath = bundle.path(forResource: fileName, ofType: "csv") else {
            return nil
        }
        return filepath
    }
}
