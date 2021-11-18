//
//  InviteCollectionView.swift
//  SocialHunter
//
//  Created by Apple on 13/11/21.
//

import UIKit

class InviteCollectionView: UICollectionView , UICollectionViewDelegate, UICollectionViewDataSource{
    var selectedIndex = -1
    
    func setDataSource() {
        dataSource = self
        delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProjectCVC", for: indexPath) as? ProjectCVC else { fatalError("Cell not found") }
        if indexPath.row == selectedIndex
        {
            cell.selected_btn.isHidden = false
            cell.backView.backgroundColor = UIColor.lightGray
        }
        else
        {
            cell.selected_btn.isHidden = true
            cell.backView.backgroundColor = UIColor.black
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        collectionView.reloadData()
        NotificationCenter.default.post(name: Notification.Name("InvitePush"),object: nil)
    }
}

extension InviteCollectionView: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = Double((collectionView.frame.width/2 - 10))
        let height = 300.0
        return CGSize(width: width , height: height)
    }

}
