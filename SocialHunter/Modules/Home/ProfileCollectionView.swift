//
//  ProfileCollectionView.swift
//  SocialHunter
//
//  Created by Manpreet Singh on 13/10/21.
//

import Foundation
import UIKit
protocol  pushVCDelegate  {
    func viewProfilePush(role: String)
}

class ProfileCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate {
    var pushDelegate : pushVCDelegate?
    var roleArr = ["Investor","Artist","Organisation","Organisation","Artist"]
    func setDataSource() {
        dataSource = self
        delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileCVC", for: indexPath) as? ProfileCVC else { fatalError("Cell not found") }
        cell.profile_btn.addTarget(self, action: #selector(viewProfile), for: .touchUpInside)
        cell.profile_btn.tag = indexPath.row
        cell.role_lbl.text = roleArr[indexPath.row]
        return cell
    }
    @objc func viewProfile(_ sender: UIButton)
    {
     //   self.pushDelegate?.viewProfilePush(role: roleArr[sender.tag])
        let dic = ["role": roleArr[sender.tag]]
        
        NotificationCenter.default.post(name: Notification.Name("PushProfile"),object: dic)

        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //collectionView.performBatchUpdates(nil, completion: nil)
    }
}

extension ProfileCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView.indexPathsForSelectedItems?.first {
        case .some(indexPath):
            let width = 170.0//Double(collectionView.frame.width/2 - 20)
            let height = 230.0
            return CGSize(width: width, height: height)
        default:
            let width = 160.0//Double(collectionView.frame.width/2 - 15)
        let height = 210.0
        return CGSize(width: width, height: height)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
}
