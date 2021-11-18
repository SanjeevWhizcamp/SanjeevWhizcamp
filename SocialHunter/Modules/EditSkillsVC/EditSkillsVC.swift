//
//  EditSkillsVC.swift
//  SocialHunter
//
//  Created by Apple on 13/11/21.
//

import UIKit
import SkyFloatingLabelTextField

class EditSkillsVC: UIViewController {
    
    var tagsArray:[String] = Array()
    
    @IBOutlet weak var txtInput: SkyFloatingLabelTextField!
    @IBOutlet var tagView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        createTagCloud(OnView: self.view, withArray: tagsArray as [AnyObject])
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    @IBAction func backAction(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func doneAction(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func addTag(_ sender: AnyObject) {
        if txtInput.text?.count != 0 {
            tagsArray.append(txtInput.text!)
            createTagCloud(OnView: self.view, withArray: tagsArray as [AnyObject])
            txtInput.text = ""
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if txtInput.text?.count != 0 {
            tagsArray.append(txtInput.text!)
            createTagCloud(OnView: self.view, withArray: tagsArray as [AnyObject])
            txtInput.text = ""
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
            button.addTarget(self, action: #selector(removeTag(_:)), for: .touchUpInside)
            bgView.addSubview(button)
            xPos = CGFloat(xPos) + CGFloat(width) + CGFloat(17.0) + CGFloat(43.0)
            view.addSubview(bgView)
            tag = tag  + 1
        }
        
    }
    
    @objc func removeTag(_ sender: AnyObject) {
        tagsArray.remove(at: (sender.tag - 1))
        createTagCloud(OnView: self.view, withArray: tagsArray as [AnyObject])
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
