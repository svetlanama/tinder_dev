//
//  CardView.swift
//  tinder_dev
//
//  Created by Svitlana Moiseyenko on 6/17/18.
//  Copyright © 2018 svitlana. All rights reserved.
//

import Foundation
import UIKit

class CardView: UIView, TinderViewDisplayable {
    
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lName: UILabel!
    @IBOutlet weak var lSkill: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        baseView.backgroundColor = UIColor.lightGray
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        self.displayAsRoundCorner()
    }
    
    
    /// Plopulate card with data
    ///
    /// - Parameter user: user
    func populate(_ user: User) {
        lName.text = user.name
        lSkill.text = user.skill.uppercased()
        imgView.image = UIImage(named: user.getImageName())
    }
    
}
