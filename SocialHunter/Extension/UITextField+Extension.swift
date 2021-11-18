//
//  UITextField+Extension.swift
//  GTSA-IOS
//
//  Created by Manpreet Singh on 12/08/21.
//

import Foundation
import  UIKit

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    
    func disableKeyboard() {
        self.inputView = UIView()
        self.inputAccessoryView = UIView()
    }
}

