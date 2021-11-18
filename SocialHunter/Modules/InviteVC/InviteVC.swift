//
//  InviteVC.swift
//  SocialHunter
//
//  Created by Apple on 13/11/21.
//

import UIKit
protocol inviteProtocol
{
    func passSt(st: String)
}
class InviteVC: UIViewController {

    @IBOutlet weak var collectionView: InviteCollectionView!
    @IBOutlet var invite_btn: UIButton!
    var delegate: inviteProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        invite_btn.isHidden = true
        collectionView.setDataSource()
        registerCell()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleMassage),
                                               name: Notification.Name("InvitePush"),
                                               object: nil)
        // Do any additional setup after loading the view.
    }
    @objc func handleMassage(notification: NSNotification) {
        invite_btn.isHidden = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    private func registerCell() {
        collectionView.registerCell(type: ProjectCVC.self)
    }
    @IBAction func backAction(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func inviteAction(_ sender: Any)
    {
        self.delegate?.passSt(st: "Invite")
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
