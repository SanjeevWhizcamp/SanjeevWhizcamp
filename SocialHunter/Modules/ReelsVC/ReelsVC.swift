//
//  ReelsVC.swift
//  SocialHunter
//
//  Created by Apple on 15/11/21.
//

import UIKit

class ReelsVC: UIViewController {

    @IBOutlet var tblvw: UITableView!
    var currentIndexPath = IndexPath()
    var artistNameArr = ["Bonny","Bonny1"]
    
    var unlike = -1
    var bookmarkSelected = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = false
        tblvw.register(UINib(nibName: "ReelsCell", bundle: nil), forCellReuseIdentifier: "Cell")
//        tblvw.isScrollEnabled = false
//        let swipeToUpVideoGesture = UISwipeGestureRecognizer(target: self, action:
//            #selector(swipeToUp(_:)))
//        swipeToUpVideoGesture.direction = .up
//            tblvw.addGestureRecognizer(swipeToUpVideoGesture)
//
//        let swipeToDownVideoGesture = UISwipeGestureRecognizer(target: self, action:
//            #selector(swipeToDown(_:)))
//        swipeToDownVideoGesture.direction = .down
//            tblvw.addGestureRecognizer(swipeToDownVideoGesture)
        // Do any additional setup after loading the view.
    }
    @objc private func swipeToUp(_ gesture: UISwipeGestureRecognizer) {
        print(currentIndexPath.row)
        let nextVideoIndexPath = currentIndexPath.row+1
        print(nextVideoIndexPath)
        if !(nextVideoIndexPath >= artistNameArr.count){
           currentIndexPath = IndexPath(row: nextVideoIndexPath, section: 0)
           tblvw.scrollToRow(at: currentIndexPath, at: .none, animated: true)
            print(currentIndexPath)
       }
        
   }
    @objc private func swipeToDown(_ gesture: UISwipeGestureRecognizer)
    {
        let nextVideoIndexPath = currentIndexPath.row - 1
        print(currentIndexPath.row)
        print(nextVideoIndexPath)
        if !(nextVideoIndexPath <= 0)
        {
          // nextVideoIndexPath = currentIndexPath.row-1
            currentIndexPath = IndexPath(row: nextVideoIndexPath, section: 0)
            tblvw.scrollToRow(at: currentIndexPath, at: .none, animated: true)
        }
    }
    var currIndexPath = IndexPath(row: 1, section: 0)
    @IBAction func crossAction(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
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
extension ReelsVC: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate
{
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return artistNameArr.count
    }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? ReelsCell else {
            fatalError("Couldn't dequeue reusable cell")
            
        }
         cell.artistName_lbl.text = artistNameArr[indexPath.row]
         currentIndexPath = indexPath
         print(currentIndexPath)
         cell.like_btn.addTarget(self, action: #selector(likeAction), for: .touchUpInside)
         cell.like_btn.tag = indexPath.row
         if unlike == indexPath.row
         {
             cell.like_btn.setBackgroundImage(UIImage(named: "HeartFilled"), for: .normal)
         }
         else
         {
             cell.like_btn.setBackgroundImage(UIImage(named: "HeartWhite"), for: .normal)
         }
         cell.bookmark_btn.addTarget(self, action: #selector(bookmarkAction), for: .touchUpInside)
         cell.bookmark_btn.tag = indexPath.row
         if bookmarkSelected == indexPath.row
         {
             cell.bookmark_btn.setBackgroundImage(UIImage(named: "BookmarkFilled"), for: .normal)
         }
         else
         {
             cell.bookmark_btn.setBackgroundImage(UIImage(named: "BookmarkWhite"), for: .normal)
         }
//        cell.postViewCellOutput = self
//        cell.setUpCell(position: indexPath.row, viewModel: viewModel)
        
     
        return cell
    }
    @objc func likeAction(_ sender: UIButton)
    {
        unlike = sender.tag
        tblvw.reloadData()
    }
    @objc func bookmarkAction(_ sender: UIButton)
    {
        bookmarkSelected = sender.tag
        tblvw.reloadData()
    }
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return self.tblvw.frame.size.height
    }

}
