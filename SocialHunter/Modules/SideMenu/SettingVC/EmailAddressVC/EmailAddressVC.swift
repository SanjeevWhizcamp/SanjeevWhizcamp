//
//  EmailAddressVC.swift
//  SocialHunter
//
//  Created by Apple on 17/11/21.
//

import UIKit

class EmailAddressVC: UIViewController {

    @IBOutlet var tblvw: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func backAction(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func addEmailAction(_ sender: Any)
    {
        let vc =  AddEmailAddressVC.instantiate()
        self.pushVC(controller: vc)
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
extension  EmailAddressVC: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EmailAddressCell
        return cell
    }
}
class EmailAddressCell: UITableViewCell
{
    @IBOutlet var lbl: UILabel!
    @IBOutlet var primary_lbl: UILabel!
    
}
