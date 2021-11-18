//
//  OrganisationProfileVC.swift
//  SocialHunter
//
//  Created by Apple on 29/10/21.
//

import UIKit
import CarbonKit
import OnlyPictures

class OrganisationProfileVC: UIViewController ,CarbonTabSwipeNavigationDelegate{
    @IBOutlet var imgvw: UIImageView!
    @IBOutlet var pageView: UIView!
    @IBOutlet weak var circularPicture_view: OnlyHorizontalPictures!
    @IBOutlet var btnAllSelected: [UIButton]!
    var pictures = [UIImage(named: "dummy-Project"),UIImage(named: "dummy-Project"), UIImage(named: "dummy-Project"), UIImage(named: "dummy-Project")]
    
    var tabSt = Bool()
    @IBOutlet var buttonsView: UIView!
    @IBOutlet var buttonsViewHeight: NSLayoutConstraint!
    @IBOutlet var sideMenuBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        imgvw.round(corners: [.bottomLeft, .bottomRight], cornerRadius: 30)
        setupMenu()
        setDataSource()
        circularPicture_view.alignment = .left
        circularPicture_view.gap = 22
        if tabSt == true
        {
            buttonsView.isHidden = true
            buttonsViewHeight.constant = 0
            sideMenuBtn.isHidden = true
        }
        else
        {
            buttonsView.isHidden = false
            buttonsViewHeight.constant = 50
            sideMenuBtn.isHidden = false
        }
        // Do any additional setup after loading the view.
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
    func setDataSource() {
        circularPicture_view.delegate = self
        circularPicture_view.dataSource = self
    }
    func setupMenu()
    {
        let tabSwipe = CarbonTabSwipeNavigation(items: ["About", "Sales","Projects","Followers","Followings"], delegate: self)
        tabSwipe.setTabExtraWidth(15)
        tabSwipe.setNormalColor(UIColor(named: "TextColor")!, font: UIFont.init(name: "Muli", size: 15.0)!)
      
        tabSwipe.setSelectedColor(UIColor.black, font: UIFont.init(name: "Muli-SemiBold", size: 17.0)!)
        tabSwipe.setIndicatorColor(UIColor(named: "DarkBlue"))
        tabSwipe.toolbar.isTranslucent = false
        tabSwipe.toolbar.barTintColor = UIColor(named: "ProfileBG")
        
      tabSwipe.insert(intoRootViewController: self, andTargetView: pageView)
    }
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        guard let storyboard = storyboard else { return UIViewController() }
        if index == 0 {
                return UIStoryboard.init(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: "OrganisationAboutTabVC")
            }
       else if index == 1 {
                return UIStoryboard.init(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: "OrganisationSalesTabVC")
            }
       else if index == 2 {
                return UIStoryboard.init(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: "InvestorProjectsVC")
            }
       else if index == 3 {
                return UIStoryboard.init(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: "FollowingTabVC")
            }
       else if index == 4 {
                return UIStoryboard.init(name: "Profile", bundle: nil).instantiateViewController(withIdentifier: "FollowerTabVC")
            }
        return UIViewController()
    }
    @IBAction func backAction(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
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
             print("Button 3 selected")
        }

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension OrganisationProfileVC: OnlyPicturesDelegate, OnlyPicturesDataSource
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
