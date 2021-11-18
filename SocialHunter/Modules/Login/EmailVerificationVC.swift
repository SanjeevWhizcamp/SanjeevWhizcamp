//
//  EmailVerificationVC.swift
//  Social Hunter
//
//  Created by Manpreet Singh on 24/08/21.
//

import UIKit

class EmailVerificationVC: UIViewController {

    @IBOutlet weak var tryAnotherEmail_lbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        tapGesture()
    }
    
    func tapGesture() {
        tryAnotherEmail_lbl.addTapGesture {
            UIApplication.getAppdelegate()?.setRootController(vcId: .loginNav, stroybordName: .Login)
        }
    }
    
    @IBAction func backClicked(_ sender: Any) {
        self.popVC()
    }
    
    @IBAction func confirmLaterClicked(_ sender: Any) {
        UIApplication.getAppdelegate()?.setRootController(vcId: .loginNav, stroybordName: .Login)
    }
    
    @IBAction func skipClicked(_ sender: Any) {
        UIApplication.getAppdelegate()?.setRootController(vcId: .loginNav, stroybordName: .Login)
    }


}
