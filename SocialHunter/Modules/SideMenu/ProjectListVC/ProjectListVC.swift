//
//  ProjectListVC.swift
//  SocialHunter
//
//  Created by Apple on 16/11/21.
//

import UIKit

class ProjectListVC: UIViewController {

    @IBOutlet var tblvw: UITableView!
    @IBOutlet var searchBarView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBarView.isHidden = true
        tblvw.register(UINib(nibName: "ProjectListCell", bundle: nil), forCellReuseIdentifier: "Cell")
        
        // Do any additional setup after loading the view.
    }
    @IBAction func searchAction(_ sender: Any)
    {
        searchBarView.isHidden = false
    }
    @IBAction func crossAction(_ sender: Any)
    {
        searchBarView.isHidden = true
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

extension ProjectListVC: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ProjectListCell
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ProjectDetailVC.instantiate()
        self.pushVC(controller: vc)
    }
}
