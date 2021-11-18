//
//  ProjectDetailVC.swift
//  SocialHunter
//
//  Created by Apple on 16/11/21.
//

import UIKit

class ProjectDetailVC: UIViewController {
    @IBOutlet var tblvw: UITableView!
    @IBOutlet var searchBarView: UIView!
    let createTaskView = UINibCreation.loadCreateTaskView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBarView.isHidden = true
        tblvw.register(UINib(nibName: "ProjectDetailCell", bundle: nil), forCellReuseIdentifier: "Cell")
        // Do any additional setup after loading the view.
    }
    @IBAction func backAction(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func searchAction(_ sender: Any)
    {
        searchBarView.isHidden = false
    }
    @IBAction func crossAction(_ sender: Any)
    {
        searchBarView.isHidden = true
    }
    @IBAction func addTaskAction(_ sender: Any)
    {
        createTaskView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        createTaskView.backView.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        createTaskView.circularView.roundCorners([.topLeft, .topRight], radius: 30.0)
        createTaskView.datePicker.isHidden = true
        createTaskView.calendar_btn.addTarget(self, action: #selector(calendarAction), for: .touchUpInside)
        createTaskView.deadline_btn.addTarget(self, action: #selector(deadlineAction), for: .touchUpInside)
        self.showDatePicker()
        self.tabBarController!.view.addSubview(createTaskView)
        
    }
    @objc func calendarAction(_ sender: UIButton)
    {
        createTaskView.datePicker.isHidden = false
    }
    @objc func deadlineAction(_ sender: UIButton)
    {
        if createTaskView.deadline_btn.isSelected == true
        {
            createTaskView.deadline_btn.setBackgroundImage(UIImage(named: "CircleFilled"), for: .normal)
            createTaskView.deadline_btn.isSelected = false
        }
        else
        {
            createTaskView.deadline_btn.setBackgroundImage(UIImage(named: "Circle"), for: .normal)
            createTaskView.deadline_btn.isSelected = true
        }
    }
    func showDatePicker(){
       //Formate Date
        createTaskView.datePicker.datePickerMode = .date

        //ToolBar
       let toolbar = UIToolbar();
       toolbar.sizeToFit()

       //done button & cancel button
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(donedatePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(cancelDatePicker))
       toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)

    // add toolbar to textField
            createTaskView.deadline_TF.inputAccessoryView = toolbar
     // add datepicker to textField
        createTaskView.deadline_TF.inputView = createTaskView.datePicker

       }
   @objc func donedatePicker(){
      //For date formate
       let formatter = DateFormatter()
       formatter.dateFormat = "dd/MM/yyyy"
       createTaskView.deadline_TF.text = formatter.string(from: createTaskView.datePicker.date)
       //dismiss date picker dialog
       self.view.endEditing(true)
        }

        @objc  func cancelDatePicker(){
           //cancel button dismiss datepicker dialog
            self.view.endEditing(true)
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
extension ProjectDetailVC: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ProjectDetailCell
        if indexPath.row == 0
        {
            cell.date_img.isHidden = true
            cell.date_lbl.isHidden = true
            cell.paid_view.isHidden = true
        }
        else if indexPath.row == 1
        {
            cell.days_img.isHidden = true
            cell.days_lbl.isHidden = true
            cell.paid_view.isHidden = true
        }
        else if indexPath.row == 2
        {
            cell.date_img.isHidden = true
            cell.date_lbl.isHidden = true
            cell.days_img.isHidden = true
            cell.days_lbl.isHidden = true
        }
        return cell
    }
}
