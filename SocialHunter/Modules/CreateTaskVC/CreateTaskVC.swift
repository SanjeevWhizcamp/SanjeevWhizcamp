//
//  CreateTaskVC.swift
//  SocialHunter
//
//  Created by Apple on 15/11/21.
//

import UIKit

class CreateTaskVC: UIViewController {

    @IBOutlet var taskName_TF: UITextField!
    @IBOutlet var desc_txtvw: UITextView!
    @IBOutlet var deadline_TF: UITextField!
    @IBOutlet var amount_TF: UITextField!
    @IBOutlet var deadline_btn: UIButton!
    @IBOutlet var datePicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        deadline_btn.isSelected = true
        showDatePicker()
        // Do any additional setup after loading the view.
    }
    @IBAction func deadlineClicked(_ sender: Any) {
        if deadline_btn.isSelected == true
        {
            deadline_btn.setBackgroundImage(UIImage(named: "CircleFilled"), for: .normal)
            deadline_btn.isSelected = false
        }
        else
        {
            deadline_btn.setBackgroundImage(UIImage(named: "Circle"), for: .normal)
            deadline_btn.isSelected = true
        }
    }
    @IBAction func backAction(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func doneAction(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    func showDatePicker(){
       //Formate Date
        datePicker.datePickerMode = .date

        //ToolBar
       let toolbar = UIToolbar();
       toolbar.sizeToFit()

       //done button & cancel button
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(donedatePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.bordered, target: self, action: #selector(cancelDatePicker))
       toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)

    // add toolbar to textField
    deadline_TF.inputAccessoryView = toolbar
     // add datepicker to textField
        deadline_TF.inputView = datePicker

       }
   @objc func donedatePicker(){
      //For date formate
       let formatter = DateFormatter()
       formatter.dateFormat = "dd/MM/yyyy"
        deadline_TF.text = formatter.string(from: datePicker.date)
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
