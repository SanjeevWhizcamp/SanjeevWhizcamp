//
//  ProjectCVC.swift
//  SocialHunter
//
//  Created by Manpreet Singh on 14/10/21.
//

import UIKit
import OnlyPictures

class ProjectCVC: UICollectionViewCell {
    
    @IBOutlet weak var circularPicture_view: OnlyHorizontalPictures!
    @IBOutlet weak var name_lbl: UILabel!
    @IBOutlet weak var company_lbl: UILabel!
    @IBOutlet weak var desc_lbl: UILabel!
    @IBOutlet weak var selected_btn: UIButton!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var circularViewHeight: NSLayoutConstraint!
    var pictures = [UIImage(named: "dummy-Project"),UIImage(named: "dummy-Project"), UIImage(named: "dummy-Project"), UIImage(named: "dummy-Project"), UIImage(named: "dummy-Project")]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setDataSource()
        circularPicture_view.alignment = .left
        circularPicture_view.gap = 22
    }
    
    func setDataSource() {
        circularPicture_view.delegate = self
        circularPicture_view.dataSource = self
    }
 
}

extension ProjectCVC:  OnlyPicturesDelegate, OnlyPicturesDataSource  {
    
    func pictureView(_ imageView: UIImageView, didSelectAt index: Int) {
        print(index)
    }

    func numberOfPictures() -> Int {
        return 5
    }
    
    func pictureViews(index: Int) -> UIImage {
        return pictures[index] ?? UIImage()
    }
    
}



