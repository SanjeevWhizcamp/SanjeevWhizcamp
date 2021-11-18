//
//  ForgotPasswordVC.swift
//  Social Hunter
//
//  Created by Manpreet on 24/08/21.
//

import UIKit

class ForgotPasswordVC: UIViewController {
    @IBOutlet var email_TF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
    }

    @IBAction func backClicked(_ sender: Any) {
        self.popVC()
    }
    
    @IBAction func sendClicked(_ sender: Any) {
        guard validationForLogin() else { return }
        Continue()
        
    }

    private func validationForLogin() -> Bool {
        guard  email_TF.text != "" else {
            self.showMessage(AppMessages.emailId)
            return false
        }
        guard self.isValidEmail(email_TF.text ?? "") == true else {
            self.showMessage(AppMessages.validEmail)
            return false
        }
       
        
        return true
    }
    private func Continue() {
        let vc = EmailVerificationVC.instantiate()
        self.pushVC(controller: vc)
    }
}
extension ForgotPasswordVC: UITextFieldDelegate
{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    if textField == email_TF
    {
        let maxLength = 30
        let currentString: NSString = textField.text! as NSString
           let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
           return newString.length <= maxLength
    }
        return true
}
}
