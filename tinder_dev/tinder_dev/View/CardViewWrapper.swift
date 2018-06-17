//
//  CardViewWrapper.swift
//  tinder_dev
//
//  Created by Svitlana Moiseyenko on 6/17/18.
//  Copyright © 2018 svitlana. All rights reserved.
//

import Foundation

import Foundation
import UIKit

class CardViewWrapper: UIView {
    
    private var cardView: CardView?
    
    var indexCard = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setUp()
    }
    
    
    /// Initial CardView setup
    private func setUp() {
        if let view = Bundle.main.loadNibNamed("CardView", owner: nil, options: nil)!.first as? CardView {
            cardView = view
            view.frame = CGRect(x: 15.0, y: 15.0, width: frame.size.width - 30, height: frame.size.height - 30)
            addSubview(view)
        }
    }
    
    /// Plopulate card with data
    ///
    /// - Parameter user: user
    func populate(_ user: User) {
        cardView?.populate(user)
    }
}
