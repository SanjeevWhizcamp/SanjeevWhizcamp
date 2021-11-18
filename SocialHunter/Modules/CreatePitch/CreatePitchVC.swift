//
//  CreatePitchVC.swift
//  SocialHunter
//
//  Created by Manpreet Singh on 13/10/21.
//

import UIKit
import SkyFloatingLabelTextField

class CreatePitchVC: UIViewController , UITextFieldDelegate{
    @IBOutlet weak var txtInput: SkyFloatingLabelTextField!
    @IBOutlet weak var desc_txtvw: UITextView!
    @IBOutlet weak var record_btn: UIButton!
    @IBOutlet var taskName_TF: UITextField!
    @IBOutlet var tagCollection: UICollectionView!
    @IBOutlet var collectionHeight: NSLayoutConstraint!
    
    @IBOutlet var tagView: UIView!
    @IBOutlet var title_lbl: UILabel!
    var taskNameSt = String()
    var descSt = String()
    var tagsArray:[String] = Array()
    var type = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        tagCollection.register(UINib(nibName: "InterestTagCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        if let frame = txtInput.superview?.convert(txtInput.frame, to: nil) {
                print(frame)
            }
        desc_txtvw.delegate = self    // Give TextViewMessage delegate Method
            
        desc_txtvw.text = "Description"
        desc_txtvw.textColor = UIColor.lightGray
        if type == "Idea"
        {
            title_lbl.text = "Create New Idea"
            record_btn.setTitle("Record a pitch", for: .normal)
        }
        else if type == "Pitch"
        {
            title_lbl.text = "Pitch an Idea"
            record_btn.setTitle("Record a pitch", for: .normal)
        }
        else if type == "Edit"
        {
            title_lbl.text = "Create New Idea"
            record_btn.setTitle("Done", for: .normal)
            taskName_TF.text = taskNameSt
            desc_txtvw.text = descSt
            
        }
        else
        {
            title_lbl.text = "Create New Idea"
            record_btn.setTitle("Record a pitch", for: .normal)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        if type == "Pitch" && type == "Edit"
        {
           
           // vc.hideBackground()
        self.tabBarController?.tabBar.isHidden = true
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        if type == "Pitch"
        {
        self.tabBarController?.tabBar.isHidden = false
        }
    }
    @IBAction func backAction(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func recordPitch(_ sender: AnyObject)
    {
//        if taskName_TF.text == ""
//        {
//            self.showMessage("Enter task name")
//        }
//        else if desc_txtvw.text == ""
//        {
//            self.showMessage("Enter description")
//        }
//        else
//        {
        if type == "Edit"
        {
            self.navigationController?.popViewController(animated: true)
        }
        else
        {
            let vc = RecordAVideoVC.instantiate()
        vc.hidesBottomBarWhenPushed = true
        self.pushVC(controller: vc)
        }
        //self.presentSheet(present: vc, sizes: [.fixed(600)])
     //   }
    }
    
    @IBAction func addTag(_ sender: AnyObject) {
        if txtInput.text?.count != 0 {
            tagsArray.append(txtInput.text!)
              // createTagCloud(OnView: self.view, withArray: tagsArray as [AnyObject])
            txtInput.text = ""
            tagCollection.reloadData()
            collectionHeight.constant = tagCollection.contentSize.height
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if txtInput.text?.count != 0 {
            tagsArray.append(txtInput.text!)
                // createTagCloud(OnView: self.view, withArray: tagsArray as [AnyObject])
            txtInput.text = ""
            tagCollection.reloadData()
        }
    }
    func createTagCloud(OnView view: UIView, withArray data:[AnyObject]) {
        
        for tempView in view.subviews {
            if tempView.tag != 0 {
                tempView.removeFromSuperview()
            }
        }
        print(txtInput.frame.origin.y)
        var xPos:CGFloat = 15.0
        var ypos: CGFloat = tagView.frame.origin.y + 120
        var tag: Int = 1
        for str in data  {
            let startstring = str as! String
            let width = startstring.widthOfString(usingFont: UIFont(name:"Verdana", size: 14.0)!)
            let checkWholeWidth = CGFloat(xPos) + CGFloat(width) + CGFloat(13.0) + CGFloat(25.5 )//13.0 is the width between lable and cross button and 25.5 is cross button width and gap to righht
            if checkWholeWidth > UIScreen.main.bounds.size.width - 30.0 {
                //we are exceeding size need to change xpos
                xPos = 15.0
                ypos = ypos + 29.0 + 8.0
            }
            
            let bgView = UIView(frame: CGRect(x: xPos, y: ypos, width:width + 17.0 + 38.5 , height: 35.0))
            bgView.layer.cornerRadius = 16
            //               bgView.backgroundColor = UIColor(red: 33.0/255.0, green: 135.0/255.0, blue:199.0/255.0, alpha: 1.0)
            bgView.backgroundColor = UIColor(named: "TextColor")
            
            bgView.tag = tag
            let textlable = UILabel(frame: CGRect(x: 17.0, y: 0.0, width: width, height: bgView.frame.size.height))
            textlable.font = UIFont(name: "Verdana", size: 13.0)
            textlable.text = startstring
            textlable.textColor = UIColor.systemBackground
            bgView.addSubview(textlable)
            
            let button = UIButton(type: .custom)
            button.frame = CGRect(x: bgView.frame.size.width - 2.5 - 26.0, y: 6.0, width: 23.0, height: 23.0)
            button.backgroundColor = UIColor.systemBackground
            button.layer.cornerRadius = CGFloat(button.frame.size.width)/CGFloat(2.0)
            button.setImage(UIImage(named: "CrossButton"), for: .normal)
            button.tag = tag
          //  button.addTarget(self, action: #selector(removeTag(_:)), for: .touchUpInside)
            bgView.addSubview(button)
            xPos = CGFloat(xPos) + CGFloat(width) + CGFloat(17.0) + CGFloat(43.0)
            view.addSubview(bgView)
            tag = tag  + 1
        }
        
    }
    
    
    
}
extension CreatePitchVC: UITextViewDelegate
{
    func textViewDidBeginEditing(_ textView: UITextView) {

            if !desc_txtvw.text!.isEmpty && desc_txtvw.text! == "Description" {
                desc_txtvw.text = ""
                desc_txtvw.textColor = UIColor.black
            }
        }

        func textViewDidEndEditing(_ textView: UITextView) {
        
            if desc_txtvw.text.isEmpty {
                desc_txtvw.text = "Description"
                desc_txtvw.textColor = UIColor.lightGray
            }
        }
}

