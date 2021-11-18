//
//  EditPitchVC.swift
//  SocialHunter
//
//  Created by Apple on 13/11/21.
//

import UIKit
import SkyFloatingLabelTextField

class EditPitchVC: UIViewController, UITextViewDelegate {
    @IBOutlet weak var txtInput: SkyFloatingLabelTextField!
    @IBOutlet weak var desc_txtvw: UITextView!
    @IBOutlet weak var record_btn: UIButton!
    @IBOutlet var taskName_TF: UITextField!
    @IBOutlet var tagView: UIView!
    @IBOutlet var title_lbl: UILabel!
    var tagsArray:[String] = Array()
    @IBOutlet var totalTagView: UIView!
    @IBOutlet var totalTagHeight: NSLayoutConstraint!
    @IBOutlet var tagCollection: UICollectionView!
    
    @IBOutlet var pickerView: UIPickerView!
    var doneView = UINibCreation.loadDonePopup()
    var pickerDaysYear = [["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"],["Hours", "Days", "Weeks", "Months"]];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        if let frame = txtInput.superview?.convert(txtInput.frame, to: nil) {
                print(frame)
            }
        desc_txtvw.delegate = self    // Give TextViewMessage delegate Method
        tagCollection.register(UINib(nibName: "InterestTagCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        desc_txtvw.text = "Description"
        desc_txtvw.textColor = UIColor.lightGray
        pickerView.reloadAllComponents()
        for subview in pickerView.subviews{
            if subview.frame.origin.y != 0{
                subview.isHidden = true
            }
        }
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
    @IBAction func doneAction(_ sender: AnyObject)
    {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func addTag(_ sender: AnyObject) {
        if txtInput.text?.count != 0 {
            tagsArray.append(txtInput.text!)
                //  createTagCloud(OnView: self.view, withArray: tagsArray as [AnyObject])
            txtInput.text = ""
            tagCollection.reloadData()
           
           
            
        }
    }
    override func viewDidLayoutSubviews() {
        totalTagHeight.constant = tagCollection.collectionViewLayout.collectionViewContentSize.height
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if txtInput.text?.count != 0 {
            tagsArray.append(txtInput.text!)
            //createTagCloud(OnView: self.view, withArray: tagsArray as [AnyObject])
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
        var ypos: CGFloat = tagView.frame.origin.y + 180
        var tag: Int = 1
        for str in data  {
            let startstring = str as! String
            let width = startstring.widthOfString(usingFont: UIFont(name:"Verdana", size: 14.0)!)
            let checkWholeWidth = CGFloat(xPos) + CGFloat(width) + CGFloat(13.0) + CGFloat(25.5)//13.0 is the width between lable and cross button and 25.5 is cross button width and gap to righht
            if checkWholeWidth > UIScreen.main.bounds.size.width - 30.0 {
                //we are exceeding size need to change xpos
                xPos = 15.0
                ypos = ypos + 29.0 + 8.0
                totalTagHeight.constant = ypos
            }
            print(ypos)
            
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
            print(tagView.frame.height)
            tag = tag  + 1
        }
        
    }
    
//    @objc func removeTag(_ sender: AnyObject) {
//        tagsArray.remove(at: (sender.tag - 1))
//        createTagCloud(OnView: self.view, withArray: tagsArray as [AnyObject])
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension EditPitchVC
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
extension EditPitchVC: UIPickerViewDelegate, UIPickerViewDataSource{
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.pickerDaysYear[component].count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        pickerView.subviews.forEach({

            $0.isHidden = $0.frame.height < 1.0
             })
        return 2
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return self.pickerDaysYear[component][row]
        }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
            return 50
        }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let label = view as? UILabel ?? UILabel()
       // pickerView.subviews[0].backgroundColor = UIColor.white
        //       pickerView.subviews[2].backgroundColor = UIColor.white
        if pickerView.selectedRow(inComponent: component) == row {
//            backView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44)
//            backView.backgroundColor = UIColor.white
            if component == 0
            {
            label.backgroundColor = UIColor.white
            label.frame = CGRect(x: 0, y: 0, width: 60, height: 30)
            }
            else
            {
                label.backgroundColor = UIColor.white
                label.frame = CGRect(x: 0, y: 0, width: 90, height: 30)
            }
            label.layer.cornerRadius = 15
            label.layer.masksToBounds = true
            label.textColor = .black
            label.text = pickerDaysYear[component][row]
            label.layer.borderColor = UIColor(named: "DarkBlue")?.cgColor
            label.layer.borderWidth = 1.0
            label.textAlignment = .center
           // backView.addSubview(label)
            
        }
        else {
            label.layer.cornerRadius = 25
            //backView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44)
            //backView.backgroundColor = UIColor.white
            label.frame = CGRect(x: 0, y: 0, width: 60, height: 36)
            label.layer.cornerRadius = 18
            label.layer.masksToBounds = true
            label.textColor = .black
           
            label.text = pickerDaysYear[component][row]
            label.textAlignment = .center
          //  backView.addSubview(label)
        }
        return label
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerView.subviews[0].subviews[0].subviews[2].backgroundColor = .systemBackground
        pickerView.reloadAllComponents()
    }
}
extension EditPitchVC: UICollectionViewDelegate, UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! InterestTagCell
        cell.lbl.text = tagsArray[indexPath.row]
        cell.cross_btn.addTarget(self, action: #selector(removeTag(_:)), for: .touchUpInside)
        cell.cross_btn.tag = indexPath.row
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tagsArray.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! InterestTagCell
        cell.lbl.text = tagsArray[indexPath.row]
        cell.lbl.sizeToFit()
        
        return CGSize(width: cell.lbl.intrinsicContentSize.width + 40, height: 40)
    }
    @objc func removeTag(_ sender: UIButton) {
        tagsArray.remove(at: (sender.tag - 1))
        createTagCloud(OnView: self.view, withArray: tagsArray as [AnyObject])
    }
}
