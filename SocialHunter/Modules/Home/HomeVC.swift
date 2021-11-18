//
//  HomeVC.swift
//  SocialHunter
//
//  Created by Manpreet Singh on 13/10/21.
//

import UIKit
import GoogleMaps
import CoreLocation

class HomeVC: UIViewController, GMSMapViewDelegate , pushVCDelegate{
    
    
    @IBOutlet weak var backView: UIView!
    var mapView: GMSMapView?
    let locationManager = CLLocationManager()
   
    var cameraPosition = GMSCameraPosition()
    @IBOutlet weak var collectionView: ProfileCollectionView!
    @IBOutlet weak var rolePopup_view: UIView!
    @IBOutlet weak var alphaView: UIView!
    
   var lat = [35.929673,38.889510,38.032120]
    var long = [-78.948237,-77.032000,-78.477510]
    override func viewDidLoad() {
        super.viewDidLoad()
        alphaView.backgroundColor = UIColor.clear.withAlphaComponent(0.1)
        alphaView.isUserInteractionEnabled = false
        rolePopup_view.isHidden = true
        registerCell()
        gestureRecogniser()
        collectionView.setDataSource()
        setMap()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleMassage),
                                               name: Notification.Name("PushProfile"),
                                               object: nil)
    }
    @objc func handleMassage(notification: NSNotification) {
        collectionView.performBatchUpdates(nil, completion: nil)
        if let dict = notification.object as? NSDictionary {
            if let myMessage = dict["role"] as? String{
                if myMessage == "Investor"
                {
                    let vc = InvestorProfileVC.instantiate()
                   vc.tabSt = false
                    
                  self.pushVC(controller: vc)
                }
                else if myMessage == "Artist"
                {
                    let vc = ArtistProfileVC.instantiate()
                    vc.tabSt = false
                    self.pushVC(controller: vc)
                }
                else if myMessage == "Organisation"
                {
                    let vc = OrganisationProfileVC.instantiate()
                    vc.tabSt = false
                    self.pushVC(controller: vc)
                }
            }
        }
    }
    @IBAction func roleAction(_ sender: Any)
    {
        if rolePopup_view.isHidden == true
        {
            rolePopup_view.isHidden = false
        }
        else if rolePopup_view.isHidden == false
        {
            rolePopup_view.isHidden = true
        }
    }
    
    func setMap()
    {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self as? CLLocationManagerDelegate
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
                }
        let camera = GMSCameraPosition.camera(withLatitude: 35.929673, longitude: -78.948237, zoom: 5);
        mapView = GMSMapView.map(withFrame: self.view.bounds, camera: camera)
        mapView!.delegate = self
        backView.addSubview(mapView!)
        mapView!.settings.myLocationButton = true
        mapView!.isMyLocationEnabled = true
       // mapView?.settings.setAllGesturesEnabled(false)
        mapView?.settings.scrollGestures = false
        mapView?.settings.consumesGesturesInView = false
        for i in 0...2 {
                    let coordinates = CLLocationCoordinate2D(latitude: lat[i], longitude: long[i])
                    let marker = GMSMarker(position: coordinates)
                    marker.map = mapView

                    marker.icon = UIImage(named: "MapPin")

                    marker.accessibilityLabel = "\(i)"
                }
    
    }

    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        // Get a reference for the custom overlay
        let index:Int! = Int(marker.accessibilityLabel!)
               
        
        let customInfoWindow = Bundle.main.loadNibNamed("MarkerView", owner: self, options: nil)?[0] as! MarkerView
        
        customInfoWindow.name_lbl.text = mapArr.nameArr[index]
        customInfoWindow.role_lbl.text = mapArr.roleArr[index]
        customInfoWindow.backView.layer.cornerRadius = 10.0
        customInfoWindow.backView.layer.masksToBounds = true
        customInfoWindow.role_img.image = UIImage(named: mapArr.roleImgArr[index])
        customInfoWindow.imgvw.image = UIImage(named: mapArr.imgArr[index])
        return customInfoWindow
    }
    
    
    private func registerCell() {
        collectionView.registerCell(type: ProfileCVC.self)
    }
    
    func gestureRecogniser() {
       // alphaView.isUserInteractionEnabled = true
        let directions: [UISwipeGestureRecognizer.Direction] = [.up, .down, .right, .left]
        for direction in directions {
            let gesture = UISwipeGestureRecognizer(target: self, action: #selector(HomeVC.handleSwipe(gesture:)))
            gesture.direction = direction
            self.view?.addGestureRecognizer(gesture)
        }
    }
    
    @objc func handleSwipe(gesture: UISwipeGestureRecognizer) {
        print(gesture.direction)
        switch gesture.direction {
        case UISwipeGestureRecognizer.Direction.down:
            print("down swipe")
          let vc = TopProfileVC.instantiate()
            
            let transition = CATransition()
            transition.duration = 0.5
            transition.type = CATransitionType.moveIn
            transition.subtype = CATransitionSubtype.fromBottom
            //view.window!.layer.add(transition, forKey: kCATransition)
            vc.modalTransitionStyle = .coverVertical
            self.navigationController?.view.layer.add(transition, forKey: nil)
             self.navigationController?.pushViewController(vc, animated: false)
         //   self.present(vc, animated: false, completion: nil)
            
            
          //  vc.modalPresentationStyle = .fullScreen
           // self.present(vc, animated: true, completion: nil)
        case UISwipeGestureRecognizer.Direction.up:
            let vc = BottomProjectVC.instantiate()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
            print("up swipe")
        case UISwipeGestureRecognizer.Direction.left:
            print("left swipe")
            let vc = ReelsVC.instantiate()
            self.pushVC(controller: vc)
        case UISwipeGestureRecognizer.Direction.right:
            print("right swipe")
           
        default:
            print("other swipe")
        }
    }
    func viewProfilePush(role: String) {
        let objectPush = ProfileCollectionView()
        objectPush.pushDelegate = self
        if role == "Investor"
        {
            let vc = InvestorProfileVC.instantiate()
            vc.tabSt = false
            self.pushVC(controller: vc)
        }
        else if role == "Artist"
        {
            let vc = ArtistProfileVC.instantiate()
            vc.tabSt = false
            self.pushVC(controller: vc)
        }
        else if role == "Organisation"
        {
            let vc = OrganisationProfileVC.instantiate()
            vc.tabSt = false
            self.pushVC(controller: vc)
        }
    }
    @IBAction func artistAction(_ sender: Any)
    {
        UserDefaults.standard.setValue("Artist", forKey: "role")
        rolePopup_view.isHidden = true
    }
    @IBAction func investorAction(_ sender: Any)
    {
        UserDefaults.standard.setValue("Investor", forKey: "role")
        rolePopup_view.isHidden = true
    }
    @IBAction func organisationAction(_ sender: Any)
    {
        UserDefaults.standard.setValue("Organisation", forKey: "role")
        rolePopup_view.isHidden = true
    }
}


