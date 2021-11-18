//
//  TaskListVC.swift
//  SocialHunter
//
//  Created by Apple on 10/11/21.
//

import UIKit

class TaskListVC: UIViewController {

    @IBOutlet var tblvw: UITableView!
    @IBOutlet var noTask_view: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func backAction(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func addTaskAction(_ sender: Any)
    {
        let vc = CreateTaskVC.instantiate()
        self.pushVC(controller: vc)
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
