//
//  PitchCell.swift
//  SocialHunter
//
//  Created by Apple on 28/10/21.
//

import UIKit

class PitchCell: UITableViewCell {

    @IBOutlet var editView: UIView!
    @IBOutlet var edit_btn: UIButton!
    @IBOutlet var withdraw_btn: UIButton!
    @IBOutlet var dots_btn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
