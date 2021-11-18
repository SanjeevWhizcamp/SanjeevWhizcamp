//
//  SideMenuVC.swift
//  SocialHunter
//
//  Created by Apple on 16/11/21.
//

import UIKit

class SideMenuVC: UIViewController {

    @IBOutlet var tblvw: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
extension SideMenuVC: UITableViewDelegate, UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sidemenu.arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! sideMenuCell
        cell.selectionStyle = .none
        cell.lbl.text = sidemenu.arr[indexPath.row]
        cell.imgvw.image = UIImage(named: sidemenu.imgArr[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0
        {
        let vc = ProjectListVC.instantiate()
        self.pushVC(controller: vc)
        }
        else if indexPath.row == 1
        {
            let vc = ActivityVC.instantiate()
            self.pushVC(controller: vc)
        }
        else if indexPath.row == 2
        {
            let vc = QRCodeVC.instantiate()
            self.pushVC(controller: vc)
        }
        else if indexPath.row == 3
        {
            let vc = SavedVC.instantiate()
            self.pushVC(controller: vc)
        }
        else if indexPath.row == 4
        {
            let vc = SettingVC.instantiate()
            self.pushVC(controller: vc)
        }
    }
}
class sideMenuCell: UITableViewCell
{
    @IBOutlet var lbl: UILabel!
    @IBOutlet var imgvw: UIImageView!
    @IBOutlet var inlineView: UIView!
    
}
