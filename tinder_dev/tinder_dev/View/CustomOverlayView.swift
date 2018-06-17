//
//  CustomOverlayView.swift
//  tinder_dev
//
//  Created by Svitlana Moiseyenko on 6/17/18.
//  Copyright © 2018 svitlana. All rights reserved.
//

import Foundation

import Foundation
import UIKit
import Koloda

class CustomOverlayView: OverlayView {
    
    @IBOutlet weak var lblDisagree: UILabel!
    @IBOutlet weak var lblAgree: UILabel!
    
    
    override var overlayState: SwipeResultDirection?  {
        didSet {
            switch overlayState {
            case .left?:
                lblDisagree.isHidden = false
                lblAgree.isHidden = true
            case .right?:
                lblDisagree.isHidden = true
                lblAgree.isHidden = false
            case .up?, .down?:
                lblDisagree.isHidden = true
                lblAgree.isHidden = true
            default:
                lblDisagree.isHidden = true
                lblAgree.isHidden = true
            }
            
        }
    }
    
    func setTitleForLeftSide(_ title: String) {
        lblDisagree.text = title
    }
    
    func setTitleForRightSide(_ title: String) {
        lblAgree.text = title
    }
    
}
