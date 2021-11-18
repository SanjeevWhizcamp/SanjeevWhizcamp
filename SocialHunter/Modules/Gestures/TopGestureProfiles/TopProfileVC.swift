//
//  TopProfileVC.swift
//  SocialHunter
//
//  Created by Manpreet Singh on 14/10/21.
//

import UIKit

class TopProfileVC: UIViewController {
    
    @IBOutlet weak var collectionView: TopProfileCollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.setDataSource()
        registerCell()
        gestureRecogniser()
    }
    func gestureRecogniser() {
       // alphaView.isUserInteractionEnabled = true
        let directions: [UISwipeGestureRecognizer.Direction] = [.up]
        for direction in directions {
            let gesture = UISwipeGestureRecognizer(target: self, action: #selector(TopProfileVC.handleSwipe(gesture:)))
            gesture.direction = direction
            self.view?.addGestureRecognizer(gesture)
        }
    }
    @objc func handleSwipe(gesture: UISwipeGestureRecognizer) {
        print(gesture.direction)
        switch gesture.direction {
        case UISwipeGestureRecognizer.Direction.up:
            print("down swipe")
          // let vc = HomeVC.instantiateTabBar()
            
            let transition = CATransition()
            transition.duration = 0.5
            transition.type = CATransitionType.moveIn
            transition.subtype = CATransitionSubtype.fromTop
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
       // self.navigationController?.popViewController(animated: true)
       // let vc = TopProfileVC.instantiate()
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.moveIn
        transition.subtype = CATransitionSubtype.fromBottom
        //view.window!.layer.add(transition, forKey: kCATransition)
        //vc.modalTransitionStyle = .coverVertical
        self.navigationController?.view.layer.add(transition, forKey: nil)
            self.navigationController?.popViewController(animated: true)
    }
    private func registerCell() {
        collectionView.registerCell(type: ProfileCVC.self)
    }
    
}
