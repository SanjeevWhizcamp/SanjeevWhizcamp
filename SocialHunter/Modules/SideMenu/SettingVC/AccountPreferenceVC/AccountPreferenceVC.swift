//
//  AccountPreferenceVC.swift
//  SocialHunter
//
//  Created by Apple on 17/11/21.
//

import UIKit

class AccountPreferenceVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func backAction(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    @IBAction func viewAction(_ sender: Any)
    {
        let role = UserDefaults.standard.value(forKey: "role") as! String
        if role == "Artist"
        {
        guard let VC = self.navigationController?.viewControllers.filter({$0.isKind(of: ArtistProfileVC.self)}).first else {return}
        self.navigationController?.popToViewController(VC, animated: true)
        }
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
