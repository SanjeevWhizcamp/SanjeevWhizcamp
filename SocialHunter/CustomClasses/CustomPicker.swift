//
//  CustomPicker.swift
//  SocialHunter
//
//  Created by Apple on 11/11/21.
//

import Foundation
import UIKit
class CustomPickerView: UIPickerView {
    
    init() {
        super.init(frame: .zero)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        subviews.forEach { $0.backgroundColor = .clear }
    }
    
    override init(frame: CGRect) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
}
