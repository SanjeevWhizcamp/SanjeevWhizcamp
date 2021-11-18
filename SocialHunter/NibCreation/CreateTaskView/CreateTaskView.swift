//
//  CreateTaskView.swift
//  SocialHunter
//
//  Created by Apple on 16/11/21.
//

import UIKit

class CreateTaskView: UIView {
    @IBOutlet var taskName_TF: UITextField!
    @IBOutlet var desc_txtvw: UITextView!
    @IBOutlet var deadline_TF: UITextField!
    @IBOutlet var deadline_btn: UIButton!
    @IBOutlet var amount_TF: UITextField!
    @IBOutlet var done_btn: UIButton!
    @IBOutlet var backView: UIView!
    
    @IBOutlet var circularView: UIView!
    @IBOutlet var calendar_btn: UIButton!
    @IBOutlet var datePicker: UIDatePicker!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
