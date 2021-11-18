//
//  AddEmailAddressVC.swift
//  SocialHunter
//
//  Created by Apple on 18/11/21.
//

import UIKit
import SkyFloatingLabelTextField

class AddEmailAddressVC: UIViewController {

    @IBOutlet var emaill_TF: SkyFloatingLabelTextField!
    @IBOutlet var password_TF: SkyFloatingLabelTextField!
    let emailAddPopup = UINibCreation.loadEmailAddPopup()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func backAction(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func submitAction(_ sender: Any)
    {
        emailAddPopup.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        emailAddPopup.lbl.text = "New Email added in your profile"
        self.view.addSubview(emailAddPopup)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
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
