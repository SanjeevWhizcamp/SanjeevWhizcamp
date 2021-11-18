//
//  InvestorProjectCollectionView.swift
//  SocialHunter
//
//  Created by Apple on 28/10/21.
//

import UIKit

class InvestorProjectCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate {
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
        cell.selected_btn.isHidden = true
        cell.company_lbl.isHidden = true
        cell.circularPicture_view.isHidden = true
        cell.circularViewHeight.constant = 0
        return cell
    }
  

}
extension InvestorProjectCollectionView: UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = 160.0
        let height = 240.0
        return CGSize(width: width , height: height)
    }
}
