//
//  ChatVC.swift
//  SocialHunter
//
//  Created by Manpreet Singh on 14/10/21.
//

import UIKit

class ChatVC: UIViewController {
    @IBOutlet weak var messageTable: UITableView!
    @IBOutlet weak var messageSearchBar: UISearchBar!
    @IBOutlet weak var onlineCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        messageSearchBar.layer.borderWidth = 1
        messageSearchBar.layer.borderColor = UIColor.clear.cgColor
        messageSearchBar.backgroundImage = UIImage()
        
        self.messageTable.estimatedRowHeight = 120
        self.messageTable.rowHeight = UITableView.automaticDimension
    }
    

}
extension ChatVC : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatTableCell", for: indexPath) as! ChatTableCell
        
        cell.notificationCounter.layer.cornerRadius = 12.5
        cell.notificationCounter.clipsToBounds = true
        
        if ((indexPath.row % 2) != 0) {
            cell.chatMessages.text = "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English"
            
        } else {
            cell.chatMessages.text = "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout."
            
        }
        
            return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = MessageVC.instantiate()
        self.pushVC(controller: controller)
    }
}
extension ChatVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChatCollectionCell", for: indexPath) as! ChatCollectionCell
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

            return CGSize(width: 70, height: 100)
        }
}
