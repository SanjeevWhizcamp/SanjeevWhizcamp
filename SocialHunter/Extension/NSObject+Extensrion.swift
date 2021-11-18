//
//  NSObject+Extensrion.swift
//  Hazlo
//
//  Created by Raman Bhola on 14/04/21.
//

import UIKit

protocol TypeName: AnyObject {
    static var typeName: String { get }
}

// Swift Objects
extension TypeName {
    static var typeName: String {
        let type = String(describing: self)
        return type
    }
}

// Bridge to Obj-C
extension NSObject: TypeName {
    class var typeName: String {
        let type = String(describing: self)
        return type
    }
}

