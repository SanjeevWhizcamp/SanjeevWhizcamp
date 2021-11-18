//
//  IntrestsVC.swift
//  Social Hunter
//
//  Created by MacAdmin on 27/08/21.
//

import UIKit
import SkyFloatingLabelTextField

class IntrestsVC: UIViewController , UITextFieldDelegate{
    
    @IBOutlet weak var txtInput: SkyFloatingLabelTextField!
    
    var tagsArray:[String] = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        if let frame = txtInput.superview?.convert(txtInput.frame, to: nil) {
                print(frame)
            }
    }
    
    @IBAction func finishClicked(_ sender: Any) {
        if tagsArray.count == 0
        {
            self.showMessage("Enter tag")
        }
        else
        {
        self.showMessage("Done")
        }
        //UIApplication.getAppdelegate()?.setRootController(vcId: .homeTab, stroybordName: .dashboard)
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
        var xPos:CGFloat = 15.0
        var ypos: CGFloat = 180.0
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
    
}

extension String {
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
}




