//
//  InvestorProjectsVC.swift
//  SocialHunter
//
//  Created by Apple on 28/10/21.
//

import UIKit

class InvestorProjectsVC: UIViewController {

    @IBOutlet var collection: InvestorProjectCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.setDataSource()
        registerCell()
        // Do any additional setup after loading the view.
    }
    private func registerCell() {
        collection.registerCell(type: ProjectCVC.self)
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
