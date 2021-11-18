//
//  EmailAddPopup.swift
//  SocialHunter
//
//  Created by Apple on 18/11/21.
//

import UIKit

class EmailAddPopup: UIView {
    @IBOutlet var backView: UIView!
    @IBOutlet var hideView: UIButton!
    @IBOutlet var lbl: UILabel!
    
    override func draw(_ rect: CGRect) {
        backView.backgroundColor = UIColor.darkGray.withAlphaComponent(0.6)
        
        // Drawing code
    }
    @IBAction func hideViewAction(_ sender: Any)
    {
        removeFromSuperview()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
