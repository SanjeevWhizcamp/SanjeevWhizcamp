//
//  ActivityVC.swift
//  SocialHunter
//
//  Created by Apple on 16/11/21.
//

import UIKit

class ActivityVC: UIViewController {
    @IBOutlet var tblvw: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: NotificationTVC.typeName, bundle: nil)
        tblvw.register(nib, forCellReuseIdentifier: NotificationTVC.typeName)
        
        let nib2 = UINib(nibName: HeaderTVC.typeName, bundle: nil)
        tblvw.register(nib2, forCellReuseIdentifier: HeaderTVC.typeName)
        // Do any additional setup after loading the view.
    }
    @IBAction func backAction(_ sender: Any)
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
extension ActivityVC: UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artistNotification.notificationArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
            
        case 0 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationTVC") as? NotificationTVC else {
                fatalError("Cell not found")
                
            }
            cell.notification_lbl.text = artistNotification.notificationArr[indexPath.row]
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        section == 0 ? "Invitation" : "Today"
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderTVC") as! HeaderTVC
        
            cell.leftSide_lbl.text = "Today"
            cell.rightSide_lbl.text = ""
        
        return cell
    }
}
