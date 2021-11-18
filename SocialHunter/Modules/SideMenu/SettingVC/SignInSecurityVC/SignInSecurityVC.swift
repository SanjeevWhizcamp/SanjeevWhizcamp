//
//  SignInSecurityVC.swift
//  SocialHunter
//
//  Created by Apple on 17/11/21.
//

import UIKit

class SignInSecurityVC: UIViewController {

    @IBOutlet var tblvw: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblvw.rowHeight = UITableView.automaticDimension
        tblvw.estimatedRowHeight = 80
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
extension SignInSecurityVC: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SigninSecurity.nameArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SignInCell
        cell.lbl.text = SigninSecurity.nameArr[indexPath.row]
        cell.desc_lbl.text = SigninSecurity.descArr[indexPath.row]
        if SigninSecurity.nameArr.count - 1 == indexPath.row
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
            let vc = EmailAddressVC.instantiate()
            self.pushVC(controller: vc)
        }
       else if indexPath.row == 1
        {
            let vc = PhoneNumberVC.instantiate()
            self.pushVC(controller: vc)
        }
        else if indexPath.row == 2
        {
            let vc = ChangePasswordVC.instantiate()
            self.pushVC(controller: vc)
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
class SignInCell: UITableViewCell
{
    @IBOutlet var lbl: UILabel!
    @IBOutlet var desc_lbl:UILabel!
    @IBOutlet var bottomLineView: UIView!
    
}
