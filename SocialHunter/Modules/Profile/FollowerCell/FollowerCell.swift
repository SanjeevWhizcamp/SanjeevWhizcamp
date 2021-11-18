//
//  FollowerCell.swift
//  SocialHunter
//
//  Created by Apple on 28/10/21.
//

import UIKit

class FollowerCell: UITableViewCell {

    @IBOutlet var imgvw: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let path = UIBezierPath(ovalIn: imgvw.bounds)
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        imgvw.layer.mask = maskLayer
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
