//
//  WithdrawPopup.swift
//  SocialHunter
//
//  Created by Apple on 13/11/21.
//

import UIKit

class WithdrawPopup: UIView {
    @IBOutlet var tblvw: WithdrawTableview!
    @IBOutlet var done_btn: UIButton!
    @IBOutlet var backView: UIView!
    @IBOutlet var roundedView: UIView!
    
    override func draw(_ rect: CGRect) {
        tblvw.setDataSource()
        registerCell()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleMassage),
                                               name: Notification.Name("TableReload"),
                                               object: nil)
    
        backView.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        roundedView.roundCorners([.topLeft,.topRight], radius: 25)
    }
@objc func handleMassage(notification: NSNotification) {
    tblvw.reloadData()
}
    private func registerCell() {
        tblvw.register(UINib(nibName: "WithdrawCell", bundle: nil), forCellReuseIdentifier: "Cell")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
