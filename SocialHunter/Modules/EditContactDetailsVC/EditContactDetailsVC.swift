//
//  EditContactDetailsVC.swift
//  SocialHunter
//
//  Created by Apple on 13/11/21.
//

import UIKit

class EditContactDetailsVC: UIViewController {
    @IBOutlet weak var mobileNum_TF: UITextField!
    @IBOutlet weak var twitter_TF: UITextField!
    @IBOutlet weak var linkedin_TF: UITextField!
    @IBOutlet weak var email_TF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    @IBAction func backAction(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func doneAction(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
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
