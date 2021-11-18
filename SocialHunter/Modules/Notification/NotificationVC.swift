//
//  NotificationVC.swift
//  SocialHunter
//
//  Created by Manpreet Singh on 14/10/21.
//

import UIKit

class NotificationVC: UIViewController {
    
    @IBOutlet weak var tableView: NotificationTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        tableView.setDataSource()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleMassage),
                                               name: Notification.Name("PushNoti"),
                                               object: nil)
    }
    @objc func handleMassage(notification: NSNotification)
    {
        if let dict = notification.object as? Int {
            if dict == 1
            {
                let vc = CheckNewIdeaVC.instantiate()
                self.pushVC(controller: vc)
            }
            else if dict == 2
            {
                let vc = ApprovedPitchVC.instantiate()
                self.pushVC(controller: vc)
            }
            else if dict == 3
            {
                let vc = ProposedEstimatesVC.instantiate()
                self.pushVC(controller: vc)
            }
            else if dict == 4
            {
                let vc = CheckNewIdeaVC.instantiate()
                self.pushVC(controller: vc)
            }
        }
    }
    private func registerCell() {
        let nib = UINib(nibName: NotificationTVC.typeName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: NotificationTVC.typeName)
        let nib1 = UINib(nibName: InvitationTVC.typeName, bundle: nil)
        tableView.register(nib1, forCellReuseIdentifier: InvitationTVC.typeName)
        let nib2 = UINib(nibName: HeaderTVC.typeName, bundle: nil)
        tableView.register(nib2, forCellReuseIdentifier: HeaderTVC.typeName)
    }
    
}
