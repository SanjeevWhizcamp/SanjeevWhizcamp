//
//  UIButton+Extension.swift
//  GTSA-IOS
//
//  Created by Manpreet Singh on 15/08/21.
//

import Foundation
import UIKit

extension UIButton {
    
    func setBackgroundImage(name: String) {
        self.setBackgroundImage(UIImage(named: name), for: .normal)
    }
    
    func setImage(name : String) {
        self.setImage(UIImage(named: name), for: .normal)
    }
}
