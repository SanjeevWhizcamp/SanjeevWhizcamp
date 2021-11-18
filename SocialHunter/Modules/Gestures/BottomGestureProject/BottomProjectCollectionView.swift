//
//  BottomProjectCollectionView.swift
//  SocialHunter
//
//  Created by Manpreet Singh on 14/10/21.
//

import UIKit
import VegaScrollFlowLayoutX

class BottomProjectCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func setDataSource() {
        dataSource = self
        delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProjectCVC", for: indexPath) as? ProjectCVC else { fatalError("Cell not found") }
        cell.selected_btn.isHidden = true
        return cell
    }

}

extension BottomProjectCollectionView: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = Double((collectionView.frame.width/2 - 30))
        let height = 340.0
        return CGSize(width: width , height: height)
    }

}
