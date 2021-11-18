//
//  WithdrawTableview.swift
//  SocialHunter
//
//  Created by Apple on 13/11/21.
//

import UIKit

class WithdrawTableview: UITableView, UITableViewDelegate, UITableViewDataSource {
    var unchecked = -1
    var arr = ["Approved by other organization","Sent by mistake","Taking long time","Others"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! WithdrawCell
        cell.lbl.text = arr[indexPath.row]
        cell.checkbox_btn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
        cell.checkbox_btn.tag = indexPath.row
        if unchecked == indexPath.row
        {
            
            cell.checkbox_btn.setBackgroundImage(UIImage(named: "Checkbox"), for: .normal)
        }
        else
        {
            
            cell.checkbox_btn.setBackgroundImage(UIImage(named: "Unselected"), for: .normal)
        }
        return cell
    }
    @objc func btnAction(_ sender: UIButton)
    {
        unchecked = sender.tag
        NotificationCenter.default.post(name: Notification.Name("TableReload"),object: nil)
      //  tblvw.reloadData()
        
    }
    func setDataSource() {
        dataSource = self
        delegate = self
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
