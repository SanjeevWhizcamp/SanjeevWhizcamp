//
//  ProfilePitchVC.swift
//  SocialHunter
//
//  Created by Apple on 29/10/21.
//

import UIKit

class ProfilePitchVC: UIViewController {

    @IBOutlet var tblvw: UITableView!
    var withdrawPopup = UINibCreation.loadWithdrawPopup()
    override func viewDidLoad() {
        super.viewDidLoad()
        tblvw.register(UINib(nibName: "PitchCell", bundle: nil), forCellReuseIdentifier: "Cell")
        // Do any additional setup after loading the view.
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
extension ProfilePitchVC: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PitchCell
        cell.selectionStyle = .none
        cell.contentView.addShadow()
        cell.editView.isHidden = true
        cell.editView.addShadow()
        cell.dots_btn.addTarget(self, action: #selector(dotAction), for: .touchUpInside)
        cell.dots_btn.tag = indexPath.row
        cell.edit_btn.addTarget(self, action: #selector(editAction), for: .touchUpInside)
        cell.edit_btn.tag = indexPath.row
        cell.withdraw_btn.addTarget(self, action: #selector(withdrawAction), for: .touchUpInside)
        cell.withdraw_btn.tag = indexPath.row
        return cell
    }
    @objc func dotAction(_ sender: UIButton)
    {
        
        let index = IndexPath(row: sender.tag, section: 0)
        let cell = tblvw.cellForRow(at: index) as! PitchCell
        cell.editView.isHidden = false
    }
    @objc func editAction(_ sender: UIButton)
    {
        let vc = EditPitchVC.instantiate()
        self.pushVC(controller: vc)
    }
    @objc func withdrawAction(_ sender: UIButton)
    {
        withdrawPopup.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        withdrawPopup.tblvw.setDataSource()
        withdrawPopup.tblvw.register(UINib(nibName: "WithdrawCell", bundle: nil), forCellReuseIdentifier: "Cell")
        self.tabBarController?.view.addSubview(withdrawPopup)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = PitchDetailVC.instantiate()
        
        self.pushVC(controller: vc)
    }
}
