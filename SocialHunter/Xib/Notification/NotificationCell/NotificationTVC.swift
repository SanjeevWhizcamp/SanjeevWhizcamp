//
//  NotificationTVC.swift
//  SocialHunter
//
//  Created by Manpreet Singh on 15/10/21.
//

import UIKit

class NotificationTVC: UITableViewCell {

    @IBOutlet var notification_lbl: UILabel!
    @IBOutlet var time_lbl: UILabel!
    @IBOutlet var imgvw: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
