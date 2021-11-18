//
//  ArtistProfileVC.swift
//  SocialHunter
//
//  Created by Manpreet Singh on 14/10/21.
//

import UIKit
import CarbonKit
import OnlyPictures
import SideMenu

class ArtistProfileVC: UIViewController,CarbonTabSwipeNavigationDelegate {
    @IBOutlet var imgvw: UIImageView!
    @IBOutlet var pageView: UIView!
    @IBOutlet weak var circularPicture_view: OnlyHorizontalPictures!
    @IBOutlet var inviteViewHeight: NSLayoutConstraint!
    @IBOutlet var inviteView: UIView!
    @IBOutlet var callBtn: UIButton!
    @IBOutlet var sideMenuBtn: UIButton!
    @IBOutlet var btnAllSelected: [UIButton]!
    
    var tabSt = Bool()
    
    
    var pictures = [UIImage(named: "dummy-Project"),UIImage(named: "dummy-Project"), UIImage(named: "dummy-Project"), UIImage(named: "dummy-Project")]
    override func viewDidLoad() {
        super.viewDidLoad()
        imgvw.round(corners: [.bottomLeft, .bottomRight], cornerRadius: 30)
        setupMenu()
        setDataSource()
        circularPicture_view.alignment = .left
        circularPicture_view.gap = 22
        if tabSt == true
        {
            inviteView.isHidden = true
            inviteViewHeight.constant = 0
            sideMenuBtn.isHidden = false
        }
        else
        {
            inviteView.isHidden = false
            inviteViewHeight.constant = 50
            sideMenuBtn.isHidden = true
        }
        // Do any additional setup after loading the view.
    }
    @IBAction func backAction(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
      //  tabBarController?.selectedIndex = 0
    }
    @IBAction func sideMenuAction(_ sender: Any)
    {
        let menuLeftNavigationController = storyboard!.instantiateViewController(withIdentifier: "LeftMenuNavigationController") as! SideMenuNavigationController
        menuLeftNavigationController.presentationStyle.backgroundColor = .red
        SideMenuManager.default.rightMenuNavigationController = menuLeftNavigationController
        var sideMenuSet = SideMenuSettings()
        sideMenuSet.presentationStyle = .menuDissolveIn
        sideMenuSet.presentationStyle.presentingEndAlpha = 0.3
        sideMenuSet.menuWidth = 280.0
        SideMenuManager.default.rightMenuNavigationController?.settings = sideMenuSet
        self.present(SideMenuManager.default.rightMenuNavigationController!, animated: true, completion: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        if tabSt == false
        {
        self.tabBarController?.tabBar.isHidden = true
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if tabSt == false
        {
        self.tabBarController?.tabBar.isHidden = false
        }
    }
    @IBAction func btnAllClicked(_ sender: UIButton) {

        for button in btnAllSelected {
            if sender.tag == button.tag{
               // button.isSelected = true;
                button.backgroundColor = UIColor(named: "DarkBlue")
                button.setTitleColor(UIColor.white, for: .normal)
            }else{
                button.isSelected = false;
                button.backgroundColor = UIColor.systemBackground
                button.setTitleColor(UIColor(named: "DarkBlue"), for: .normal)
            }
        }

        if sender.tag == 1{
            print("Button 1 selected")
        }else if sender.tag == 2{
            print("Button 2 selected")
        }else if sender.tag == 3{
            let vc = InviteVC.instantiate()
            self.pushVC(controller: vc)
             print("Button 3 selected")
        }

    }
    func setDataSource() {
        circularPicture_view.delegate = self
        circularPicture_view.dataSource = self
    }
    func setupMenu()
    {
        let tabSwipe = CarbonTabSwipeNavigation(items: ["About","Pitches","Followers","Followings"], delegate: self)
        tabSwipe.setTabExtraWidth(20)
        tabSwipe.setNormalColor(UIColor(red: 0.00, green: 0.67, blue: 0.75, alpha: 1.00), font: UIFont.init(name: "Muli", size: 16.0)!)
        tabSwipe.setNormalColor(UIColor(named: "TextColor")!)
      //  tabSwipe.carbonSegmentedControl?.getWidthForSegment(at: )
        
        tabSwipe.setSelectedColor(UIColor.black, font: UIFont.init(name: "Muli-SemiBold", size: 16.0)!)
        tabSwipe.setIndicatorColor(UIColor(named: "DarkBlue"))
        tabSwipe.toolbar.isTranslucent = true
        tabSwipe.toolbar.barTintColor = UIColor.systemBackground
       

      tabSwipe.insert(intoRootViewController: self, andTargetView: pageView)
    }
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        guard let storyboard = storyboard else { return UIViewController() }
        if index == 0 {
                return UIStoryboard.init(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: "ArtistAboutVC")
            }
//       else if index == 1 {
//                return UIStoryboard.init(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: "InvestorProjectsVC")
//            }
       else if index == 1 {
                return UIStoryboard.init(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: "ProfilePitchVC")
            }
       else if index == 2 {
                return UIStoryboard.init(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: "FollowingTabVC")
            }
       else if index == 3 {
                return UIStoryboard.init(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: "FollowerTabVC")
            }
        return UIViewController()
    }
    
}
extension ArtistProfileVC: OnlyPicturesDelegate, OnlyPicturesDataSource
{
    func pictureView(_ imageView: UIImageView, didSelectAt index: Int) {
        print(index)
    }

    func numberOfPictures() -> Int {
        return 4
    }
    
    func pictureViews(index: Int) -> UIImage {
        return pictures[index] ?? UIImage()
    }
}
