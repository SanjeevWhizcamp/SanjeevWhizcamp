//
//  RecordedDescriptionView.swift
//  SocialHunter
//
//  Created by Apple on 12/11/21.
//

import UIKit

class RecordedDescriptionView: UIView{
    

    @IBOutlet var tagCollection: UICollectionView!
    @IBOutlet var next_btn: UIButton!
    @IBOutlet var backView: UIView!
    @IBOutlet var name_lbl: UILabel!
    @IBOutlet var description_lbl: UILabel!
    @IBOutlet var edit_btn: UIButton!
    
    override func draw(_ rect: CGRect) {
        backView.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
