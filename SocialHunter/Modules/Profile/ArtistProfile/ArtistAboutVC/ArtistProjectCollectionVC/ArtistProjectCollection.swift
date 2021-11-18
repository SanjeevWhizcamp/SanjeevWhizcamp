//
//  ArtistProjectCollection.swift
//  SocialHunter
//
//  Created by Apple on 29/10/21.
//

import UIKit

class ArtistProjectCollection: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate {
    func setDataSource() {
        dataSource = self
        delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProjectCVC", for: indexPath) as? ProjectCVC
        else { fatalError("Cell not found") }
        cell.company_lbl.isHidden = true
        cell.selected_btn.isHidden = true
        cell.name_lbl.font = UIFont(name: "Muli-SemiBold", size: 13.0)
        cell.desc_lbl.font = UIFont(name: "Muli", size: 10.0)
        cell.circularPicture_view.isHidden = true
        cell.circularViewHeight.constant = 0
        return cell
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
extension ArtistProjectCollection: UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = 130.0
        let height = 200.0
        return CGSize(width: width , height: height)
    }
}
