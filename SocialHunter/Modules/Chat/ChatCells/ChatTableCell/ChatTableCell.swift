//
//  ChatTableCell.swift
//  SocialHunter
//
//  Created by Apple on 09/11/21.
//

import UIKit

class ChatTableCell: UITableViewCell {
    @IBOutlet weak var notificationCounter: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var userStatus: UIImageView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var chatMessages: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
