//
//  PeopleCell.swift
//  SocialHunter
//
//  Created by Apple on 01/11/21.
//

import UIKit

class PeopleCell: UITableViewCell {

    @IBOutlet var imgvw: UIImageView!
    @IBOutlet var name_lbl: UILabel!
    @IBOutlet var role_lbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
