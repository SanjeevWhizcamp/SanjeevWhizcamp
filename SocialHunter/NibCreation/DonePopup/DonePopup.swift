//
//  DonePopup.swift
//  SocialHunter
//
//  Created by Apple on 11/11/21.
//

import UIKit

class DonePopup: UIView {
    @IBOutlet var backView: UIView!
    @IBOutlet var hideView: UIButton!
    override func draw(_ rect: CGRect) {
        backView.backgroundColor = UIColor.darkGray.withAlphaComponent(0.6)
        
        // Drawing code
    }
    @IBAction func hideViewAction(_ sender: Any)
    {
        removeFromSuperview()
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
