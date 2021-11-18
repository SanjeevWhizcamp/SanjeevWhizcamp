//
//  ArtistSelectionVC.swift
//  Social Hunter
//
//  Created by MacAdmin on 24/08/21.
//

import UIKit

class ArtistSelectionVC: UIViewController {
    @IBOutlet var tblvw: UITableView!
    @IBOutlet var nextBtn: UIButton!
    
    var unchecked = -1
    var arr = ["I am an Artist","I am an Investor","I am an Organization"]
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.isHidden = true
    }
    
    @IBAction func didTapBack(_ sender: Any) {
        self.popVC()
    }
    
    @IBAction func didTapNext(_ sender: Any) {
        let vc = IntrestsVC.instantiate()
        self.pushVC(controller: vc)
    }

}
extension ArtistSelectionVC: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! roleCell
        cell.lbl.text = arr[indexPath.row]
        cell.radioBtn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
        cell.radioBtn.tag = indexPath.row
        if unchecked == indexPath.row
        {
            cell.primary_lbl.isHidden = false
            cell.radioBtn.setBackgroundImage(UIImage(named: "Checkbox"), for: .normal)
        }
        else
        {
            cell.primary_lbl.isHidden = true
            cell.radioBtn.setBackgroundImage(UIImage(named: "Unselected"), for: .normal)
        }
        return cell
    }
    @objc func btnAction(_ sender: UIButton)
    {
        unchecked = sender.tag
        tblvw.reloadData()
        nextBtn.isHidden = false
    }
}
class roleCell: UITableViewCell
{
    @IBOutlet var radioBtn: UIButton!
    @IBOutlet var lbl: UILabel!
    @IBOutlet var primary_lbl: UILabel!
}
