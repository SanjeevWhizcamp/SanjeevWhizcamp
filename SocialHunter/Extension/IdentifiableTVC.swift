//
//  IdentifiableTVC.swift
//  Marco Ritacca
//
//  Created by Harmandeep Singh on 18/09/20.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

protocol IdentifiableTVC {
    associatedtype IdentifiableType
    
    static var identifier: String {set get}
    var data: IdentifiableType? { get set }
}

extension IdentifiableTVC where Self: UITableViewCell {
    
    func getCell(
        _ tableView: UITableView, for indexPath: IndexPath) -> Self? {
        return tableView.dequeueReusableCell(withIdentifier: Self.identifier, for: indexPath) as? Self
    }
    
    static func getCell(
        _ tableView: UITableView, for indexPath: IndexPath) -> Self? {
        return tableView.dequeueReusableCell(withIdentifier: Self.identifier, for: indexPath) as? Self
    }
}
