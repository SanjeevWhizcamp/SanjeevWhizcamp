//
//  AddEstimatesVC.swift
//  SocialHunter
//
//  Created by Apple on 11/11/21.
//

import UIKit

class AddEstimatesVC: UIViewController {

    @IBOutlet var pickerView: UIPickerView!
    var doneView = UINibCreation.loadDonePopup()
    var pickerDaysYear = [["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"],["Hours", "Days", "Weeks", "Months"]];
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.reloadAllComponents()
        for subview in pickerView.subviews{
            if subview.frame.origin.y != 0{
                subview.isHidden = true
            }
        }
     
    }
    @IBAction func doneAction(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
        doneView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        self.view.addSubview(doneView)
        
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
extension AddEstimatesVC: UIPickerViewDelegate, UIPickerViewDataSource
{
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.pickerDaysYear[component].count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        pickerView.subviews.forEach({

            $0.isHidden = $0.frame.height < 1.0
             })
        return 2
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return self.pickerDaysYear[component][row]
        }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
            return 50
        }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let label = view as? UILabel ?? UILabel()
       // pickerView.subviews[0].backgroundColor = UIColor.white
        //       pickerView.subviews[2].backgroundColor = UIColor.white
        if pickerView.selectedRow(inComponent: component) == row {
//            backView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44)
//            backView.backgroundColor = UIColor.white
            if component == 0
            {
            label.backgroundColor = UIColor.white
            label.frame = CGRect(x: 0, y: 0, width: 60, height: 30)
            }
            else
            {
                label.backgroundColor = UIColor.white
                label.frame = CGRect(x: 0, y: 0, width: 90, height: 30)
            }
            label.layer.cornerRadius = 15
            label.layer.masksToBounds = true
            label.textColor = .black
            label.text = pickerDaysYear[component][row]
            label.layer.borderColor = UIColor(named: "DarkBlue")?.cgColor
            label.layer.borderWidth = 1.0
            label.textAlignment = .center
           // backView.addSubview(label)
            
        }
        else {
            label.layer.cornerRadius = 25
            //backView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44)
            //backView.backgroundColor = UIColor.white
            label.frame = CGRect(x: 0, y: 0, width: 60, height: 36)
            label.layer.cornerRadius = 18
            label.layer.masksToBounds = true
            label.textColor = .black
           
            label.text = pickerDaysYear[component][row]
            label.textAlignment = .center
          //  backView.addSubview(label)
        }
        return label
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerView.subviews[0].subviews[0].subviews[2].backgroundColor = .systemBackground
        pickerView.reloadAllComponents()
    }
}
