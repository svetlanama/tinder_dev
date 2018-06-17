//
//  TinderViewDisplayable.swift
//  tinder_dev
//
//  Created by Svitlana Moiseyenko on 6/17/18.
//  Copyright © 2018 svitlana. All rights reserved.
//

import Foundation
import UIKit

protocol TinderViewDisplayable: class{}

extension TinderViewDisplayable where Self: UIView {
    
    func displayAsRoundCorner() {
        
        self.layer.cornerRadius = 5.0
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 2
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = false
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.lightGray.cgColor
    }
}

