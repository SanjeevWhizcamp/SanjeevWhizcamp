//
//  ViewController.swift
//  Social Hunter
//
//  Created by Manpreet on /08/21.
//
import Foundation
import UIKit


class LoginVC: UIViewController {
    
    @IBOutlet weak var lblWelcome: UILabel!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
    }
    
    @IBAction func forgetClicked(_ sender: Any) {
        let vc = ForgotPasswordVC.instantiate()
        self.pushVC(controller: vc)
    }
    
    @IBAction func loginClicked(_ sender: Any) {
        
            guard validationForLogin() else { return }
            Continue()
       
    }
    private func validationForLogin() -> Bool {
        guard  txtEmail.text != "" else {
            self.showMessage(AppMessages.emailId)
            return false
        }
        guard self.isValidEmail(txtEmail.text ?? "") == true else {
            self.showMessage(AppMessages.validEmail)
            return false
        }
        guard  txtPassword.text != "" else {
            self.showMessage(AppMessages.password)
            return false
        }
        
        return true
    }
    private func Continue() {
        //self.showMessage("Login Successful")
        UIApplication.getAppdelegate()?.setRootController(vcId: .homeTab, stroybordName: .dashboard)
    }
    @IBAction func signUpClicked(_ sender: Any) {
        let vc = RegisterVC.instantiate()
        self.pushVC(controller: vc)
    }
    
}
extension LoginVC: UITextFieldDelegate
{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == txtEmail
        {
            let maxLength = 30
            let currentString: NSString = textField.text! as NSString
               let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
               return newString.length <= maxLength
        }
        else if textField == txtPassword
        {
            let maxLength = 20
            let currentString: NSString = textField.text! as NSString
               let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
               return newString.length <= maxLength
        }
        return true
    }
}
