//
//  BottomProjectVC.swift
//  SocialHunter
//
//  Created by Manpreet Singh on 14/10/21.
//

import UIKit
import VegaScrollFlowLayoutX

class BottomProjectVC: UIViewController {

    @IBOutlet weak var collectionView: BottomProjectCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.setDataSource()
        registerCell()
//        let layout = VegaScrollFlowLayout()
//        collectionView.collectionViewLayout = layout
//        layout.minimumLineSpacing = 10
//        layout.itemSize = CGSize(width: collectionView.frame.width/2 - 30, height: 340)
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 20, right: 20)
       
    }
    func gestureRecogniser() {
       // alphaView.isUserInteractionEnabled = true
        let directions: [UISwipeGestureRecognizer.Direction] = [.down]
        for direction in directions {
            let gesture = UISwipeGestureRecognizer(target: self, action: #selector(TopProfileVC.handleSwipe(gesture:)))
            gesture.direction = direction
            self.view?.addGestureRecognizer(gesture)
        }
    }
    @objc func handleSwipe(gesture: UISwipeGestureRecognizer) {
        print(gesture.direction)
        switch gesture.direction {
        case UISwipeGestureRecognizer.Direction.down:
            print("down swipe")
          // let vc = HomeVC.instantiateTabBar()
            
            let transition = CATransition()
            transition.duration = 0.5
            transition.type = CATransitionType.moveIn
            transition.subtype = CATransitionSubtype.fromBottom
            //view.window!.layer.add(transition, forKey: kCATransition)
           // vc.modalTransitionStyle = .coverVertical
            self.navigationController?.view.layer.add(transition, forKey: nil)
            self.navigationController?.popViewController(animated: true)
               // self.navigationController?.pushViewController(vc, animated: false)
        default:
            break
        }
    }
    @IBAction func crossAction(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
    }
    private func registerCell() {
        collectionView.registerCell(type: ProjectCVC.self)
    }
    

}
