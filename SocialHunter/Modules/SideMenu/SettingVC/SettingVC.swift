//
//  SettingVC.swift
//  SocialHunter
//
//  Created by Apple on 17/11/21.
//

import UIKit

class SettingVC: UIViewController {

    @IBOutlet var tblvw: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblvw.register(UINib(nibName: "SettingCell", bundle: nil), forCellReuseIdentifier: "Cell")
        tblvw.rowHeight = UITableView.automaticDimension
        tblvw.estimatedRowHeight = 100
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension SettingVC: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return setting.settingNameArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SettingCell
        cell.selectionStyle = .none
        cell.lbl.text = setting.settingNameArr[indexPath.row]
        cell.desc_lbl.text = setting.settingDescArr[indexPath.row]
        cell.imgvw.image = UIImage(named: setting.imgArr[indexPath.row])
        if setting.settingNameArr.count - 1 == indexPath.row
        {
            cell.bottomLineView.isHidden = true
        }
        else
        {
            cell.bottomLineView.isHidden = false
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0
        {
            let vc = AccountPreferenceVC.instantiate()
            self.pushVC(controller: vc)
        }
        else if indexPath.row == 1
        {
            let vc = SignInSecurityVC.instantiate()
            self.pushVC(controller: vc)
        }
        else if indexPath.row == 2
        {
            let vc = HelpVC.instantiate()
            self.pushVC(controller: vc)
        }
        else if indexPath.row == 3
        {
            let vc = TermsVC.instantiate()
            self.pushVC(controller: vc)
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
