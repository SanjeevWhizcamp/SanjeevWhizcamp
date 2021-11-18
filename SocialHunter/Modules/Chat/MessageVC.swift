//
//  MessageVC.swift
//  SocialHunter
//
//  Created by Apple on 09/11/21.
//

import UIKit
import GrowingTextView

class MessageVC: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var chatTable: UITableView!
    @IBOutlet var txtvw: GrowingTextView!
    @IBOutlet var txtvwHeight: NSLayoutConstraint!
    let imagePicker = UIImagePickerController()
    var messages = [Message]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        txtvw.text = "Type a Message"
        txtvw.textColor = UIColor.darkGray
        automaticallyAdjustsScrollViewInsets = false
        // Do any additional setup after loading the view.
    }
    func setupUI(){
 
    self.chatTable.register(UINib(nibName: "SenderCell", bundle: nil), forCellReuseIdentifier: "SenderCell")
    self.chatTable.register(UINib(nibName: "ReceiveCell", bundle: nil), forCellReuseIdentifier: "ReceiveCell")
        self.chatTable.register(UINib(nibName: "ChatPhotoCell", bundle: nil), forCellReuseIdentifier: "PhotoCell")
            self.chatTable.tableFooterView = UIView()
            self.chatTable.separatorStyle = .none
        
        self.chatTable.estimatedRowHeight = 120
        self.chatTable.rowHeight = UITableView.automaticDimension
       fetchData()
        }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func fetchData() {
        messages = MessageStore.getAll()
        chatTable.reloadData()
        scrollToBottom()
    }
    @IBAction func galleryAction(_ sender: Any)
    {
        imagePicker.allowsEditing = false
           imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
           present(imagePicker, animated: true)
    }
    @IBAction func backAction(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func send(_ sender: Any)
    {
      //  Message[messages.count]
        print(messages.count)
        let indexPath = IndexPath(row: self.messages.count-1, section: 0)
        messages[indexPath.row].text = txtvw.text!
        messages[indexPath.row].side = .right
        print(messages[messages.count - 1])
        print([messages.count - 1])
        let ms = messages[indexPath.row]
        messages.append(ms)
        //print(ms)
       // print(messages)
        chatTable.reloadData()
        scrollToBottom()
    }
    // MARK: - UIPickerControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo
    info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            let indexPath = IndexPath(row: self.messages.count-1, section: 0)
            messages[indexPath.row].text = ""
            messages[indexPath.row].side = .right
            messages[indexPath.row].image = pickedImage
            print(messages[messages.count - 1])
            print([messages.count - 1])
            let ms = messages[indexPath.row]
            messages.append(ms)
            //print(ms)
           // print(messages)
            chatTable.reloadData()
            scrollToBottom()
            imagePicker.dismiss(animated: true, completion: nil)
          //  photoArray.append(pickedImage)
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
extension MessageVC: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let message = messages[indexPath.row]
        if message.side == .left {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SenderCell") as! SenderCell
         cell.right_lbl.text = message.text
            if message.image != nil
            {
                let photocell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! ChatPhotoCell
                return photocell
            }
         //cell.left_view.roundCorners(corners: [.topRight,.bottomLeft,.bottomRight], radius: 20.0)
           // cell.configureCell(message: message)
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReceiveCell") as! ReceiveCell
         cell.left_lbl.text = message.text
        // cell.right_view.roundCorners(corners: [.topLeft,.bottomLeft,.bottomRight], radius: 20.0)
            //cell.configureCell(message: message)
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func scrollToBottom()  {
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: self.messages.count-1, section: 0)
            self.chatTable.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
}
extension MessageVC: GrowingTextViewDelegate, UITextViewDelegate
{
    func textViewDidChangeHeight(_ textView: GrowingTextView, height: CGFloat) {
           UIView.animate(withDuration: 0.2) {
               self.view.layoutIfNeeded()
           }
        }
    func textViewDidChange(_ textView: UITextView) {
        if txtvw.contentSize.height < 100
        {
             txtvwHeight.constant = txtvw.contentSize.height + 10
        }
        }
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.darkGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Type a Message"
            textView.textColor = UIColor.darkGray
        }
    }
}
