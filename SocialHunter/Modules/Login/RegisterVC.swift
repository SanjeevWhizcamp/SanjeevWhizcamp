//
//  RegisterVC.swift
//  Social Hunter
//
//  Created by Manpreet on 24/08/21.
//

import UIKit

class RegisterVC: UIViewController {
    @IBOutlet var fullName_TF: UITextField!
    @IBOutlet var emailId_TF: UITextField!
    @IBOutlet var password_TF: UITextField!
    @IBOutlet var phoneNum_TF: UITextField!
    @IBOutlet var terms_btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        terms_btn.isSelected = true
        hideKeyboardWhenTappedAround()
    }
    @IBAction func termsClicked(_ sender: Any) {
        if terms_btn.isSelected == true
        {
            terms_btn.setBackgroundImage(UIImage(named: "Checkbox"), for: .normal)
            terms_btn.isSelected = false
        }
        else
        {
            terms_btn.setBackgroundImage(UIImage(named: "Unselected"), for: .normal)
            terms_btn.isSelected = true
        }
    }
    @IBAction func registerClicked(_ sender: Any) {
        guard validationForLogin() else { return }
        Continue()
    }
    
    @IBAction func backClicked(_ sender: Any) {
        self.popVC()
    }
    private func validationForLogin() -> Bool {
        guard  fullName_TF.text != "" else {
            self.showMessage(AppMessages.fullName)
            return false
        }
        guard  emailId_TF.text != "" else {
            self.showMessage(AppMessages.emailId)
            return false
        }
        
        guard self.isValidEmail(emailId_TF.text ?? "") == true else {
            self.showMessage(AppMessages.validEmail)
            return false
        }
        guard  password_TF.text != "" else {
            self.showMessage(AppMessages.password)
            return false
        }
        guard phoneNum_TF.text != ""  else {
            self.showMessage(AppMessages.phoneNumber)
            return false
        }
        return true
    }
    private func Continue() {
        let vc = VerifyNumberVC.instantiate()
        self.pushVC(controller: vc)
    }

}
extension RegisterVC: UITextFieldDelegate
{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == fullName_TF
        {
            let maxLength = 30
            let currentString: NSString = textField.text! as NSString
               let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
               return newString.length <= maxLength
        }
        else if textField == emailId_TF
        {
            let maxLength = 30
            let currentString: NSString = textField.text! as NSString
               let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
               return newString.length <= maxLength
        }
        else if textField == password_TF
        {
            let maxLength = 20
            let currentString: NSString = textField.text! as NSString
               let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
               return newString.length <= maxLength
        }
        else if textField == phoneNum_TF
        {
            let maxLength = 10
            let currentString: NSString = textField.text! as NSString
               let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
               return newString.length <= maxLength
        }
        return true
    }
    
}
