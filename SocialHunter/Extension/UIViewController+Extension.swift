//
//  UIViewController+Extension.swift
//  GTSA-IOS
//
//  Created by Manpreet Singh on 11/08/21.
//

import Foundation
import UIKit
import FittedSheets

extension UIViewController {
    
    func presentSheet(present at: UIViewController,sizes: [SheetSize] = [.fixed(350)]){
        
        let sheetCo = SheetViewController(controller: at,sizes: sizes)
        // sheetCo.hasBlurBackground = true
        // sheetCo.gripColor = .white
        sheetCo.pullBarBackgroundColor = .white
        sheetCo.modalPresentationStyle = .overFullScreen
        //self.view.backgroundColor = .white
        sheetCo.dismissOnPull = true
        sheetCo.gripSize = CGSize(width: 100, height: 6)
        sheetCo.allowPullingPastMaxHeight = false
        sheetCo.pullBarBackgroundColor = UIColor(named: "PopVCBackground")
        
        sheetCo.overlayColor = UIColor.gray.withAlphaComponent(0.2)
        sheetCo.cornerRadius = 25
        
        present(sheetCo, animated: true, completion: nil)
    }
    // hide Keyboard on outside touch
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // push VC
    func pushVC(controller : UIViewController) {
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    // pop VC
    func popVC(animated: Bool = true) {
        self.navigationController?.popViewController(animated: animated )
    }
    
    
    // Show Alert
    func showMessage(_ message: String) {
        let alertController = UIAlertController(title: message, message: "", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        alertController.view.tintColor = UIColor(named: "TextColor")
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showMessage(_ message: String, handler: ((UIAlertAction) -> Void)?) {
        let alertController = UIAlertController(title: message, message: "", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: handler))
        alertController.view.tintColor = UIColor.black
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showMessage(_ title: String, _ message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        alertController.view.tintColor = UIColor.black
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showMessage(_ title: String, _ message: String, handler: ((UIAlertAction) -> Void)?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: handler))
        alertController.view.tintColor = UIColor.black
        self.present(alertController, animated: true, completion: nil)
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
}




