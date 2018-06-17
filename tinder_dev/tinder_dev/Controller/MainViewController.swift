//
//  ViewController.swift
//  tinder_dev
//
//  Created by Svitlana Moiseyenko on 6/17/18.
//  Copyright © 2018 svitlana. All rights reserved.
//

import UIKit
import Koloda

class MainViewController: UIViewController {

    @IBOutlet weak var kolodaView: KolodaView!
    
    var users = [User] () {
        didSet {
            kolodaView.reloadData()
        }
    }
    
    @IBAction func onUndo() {
        kolodaView.resetCurrentCardIndex()
    }
    
    @IBAction func onLeft() {
        kolodaView.swipe(.left)
    }
    
    @IBAction func onRight() {
        kolodaView.swipe(.right)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initKolodaView()
        initializeData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    /// Load intial data
    private func initializeData() {
        users = ParseUtils.parseUsers(fileName: "data")
    }
    
    /// Initialize Koloda
    private func initKolodaView() {
        kolodaView.dataSource = self
        kolodaView.delegate = self
    }
}


extension MainViewController: KolodaViewDataSource {
    
    func kolodaNumberOfCards(_ koloda:KolodaView) -> Int {
        return users.count
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        let cardView = CardViewWrapper(frame: koloda.frame)
        cardView.indexCard = Int(index)
        
        let user = users[index]
        cardView.populate(user)
        return cardView
    }
    
    func koloda(_ koloda: KolodaView, viewForCardOverlayAt index: Int) -> OverlayView? {
        return Bundle.main.loadNibNamed("CustomOverlayView", owner: self, options: nil)![0] as? CustomOverlayView
    }
}

extension MainViewController: KolodaViewDelegate {
    func koloda(_ koloda: KolodaView, allowedDirectionsForIndex index: Int) -> [SwipeResultDirection] {
        return [.left, .right]
    }
}
