//
//  NotificationTableView.swift
//  SocialHunter
//
//  Created by Manpreet Singh on 15/10/21.
//

import UIKit

class NotificationTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
   
    func setDataSource() {
        dataSource = self
        delegate = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 0 ? 5 : artistNotification.notificationArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
            
        case 0 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "InvitationTVC") as? InvitationTVC else {
                fatalError("Cell not found")
            }
            return cell
            
        case 1 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationTVC") as? NotificationTVC else {
                fatalError("Cell not found")
                
            }
            cell.notification_lbl.text = artistNotification.notificationArr[indexPath.row]
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1
        {
            NotificationCenter.default.post(name: Notification.Name("PushNoti"),object: indexPath.row + 1)
    
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        section == 0 ? "Invitation" : "Today"
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderTVC") as! HeaderTVC
        if section == 0 {
            cell.leftSide_lbl.text = "Invitation"
            cell.rightSide_lbl.text = "See All"
        } else {
            cell.leftSide_lbl.text = "Today"
            cell.rightSide_lbl.text = "Clear"
        }
        return cell
    }
    
}

enum NotificationType {
    case Today
    case Invitatoin
    
    var rows : Int {
        switch self {
        case .Today:
            return 5
        case .Invitatoin:
            return 10
        }
    }
    
}
