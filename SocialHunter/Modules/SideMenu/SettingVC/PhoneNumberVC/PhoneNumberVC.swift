//
//  PhoneNumberVC.swift
//  SocialHunter
//
//  Created by Apple on 18/11/21.
//

import UIKit

class PhoneNumberVC: UIViewController {

    @IBOutlet var tblvw: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func backAction(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func addPhoneAction(_ sender: Any)
    {
        let vc =  AddPhoneNumVC.instantiate()
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
extension PhoneNumberVC: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PhoneNumberCell
        return cell
    }
}
class PhoneNumberCell: UITableViewCell
{
    @IBOutlet var lbl: UILabel!
    @IBOutlet var primary_lbl: UILabel!
    
}
