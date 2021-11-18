//
//  ReelsCell.swift
//  SocialHunter
//
//  Created by Apple on 15/11/21.
//

import UIKit
import ReadMoreTextView

class ReelsCell: UITableViewCell {

    @IBOutlet var imgvw: UIImageView!
    @IBOutlet var playerView: UIView!
    @IBOutlet var artistName_lbl: UILabel!
    @IBOutlet var roleName_lbl: UILabel!
    @IBOutlet var artistImgvw: UIImageView!
    @IBOutlet var like_btn: UIButton!
    @IBOutlet var comment_btn: UIButton!
    @IBOutlet var bookmark_btn: UIButton!
    @IBOutlet var txtvw: ReadMoreTextView!
    @IBOutlet var alphaView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        alphaView.backgroundColor = UIColor.brown.withAlphaComponent(0.4)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
