//
//  TopProfileCollectionView.swift
//  SocialHunter
//
//  Created by Manpreet Singh on 14/10/21.
//

import UIKit

class TopProfileCollectionView: UICollectionView,UICollectionViewDelegate, UICollectionViewDataSource {
    
    func setDataSource() {
        dataSource = self
        delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileCVC", for: indexPath) as? ProfileCVC else { fatalError("Cell not found") }
        cell.role_lbl.isHidden = true
        cell.layer.cornerRadius = 10.0
        cell.layer.borderWidth = 0.0
        cell.layer.shadowColor = UIColor(named: "PhoneVerify")?.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2)
        cell.layer.shadowRadius = 2
        cell.layer.shadowOpacity = 0.7
        cell.layer.masksToBounds = false
        return cell
    }
    
}

extension TopProfileCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = Double(collectionView.frame.width/2 - 30)
        let height = 220.0
        return CGSize(width: width, height: height)
    }
    
}
