//
//  ProjectDetailCell.swift
//  SocialHunter
//
//  Created by Apple on 16/11/21.
//

import UIKit

class ProjectDetailCell: UITableViewCell {

    @IBOutlet var days_lbl: UILabel!
    @IBOutlet var days_img: UIImageView!
    @IBOutlet var date_lbl: UILabel!
    @IBOutlet var date_img: UIImageView!
    @IBOutlet var paid_view: UIView!
    @IBOutlet var status_lbl: UILabel!
    @IBOutlet var status_view: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
