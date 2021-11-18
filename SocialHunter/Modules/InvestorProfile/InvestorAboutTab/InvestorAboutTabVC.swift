//
//  InvestorAboutTabVC.swift
//  SocialHunter
//
//  Created by Apple on 28/10/21.
//

import UIKit

class InvestorAboutTabVC: UIViewController {
    @IBOutlet var skillCollection: UICollectionView!
    var skillArr = ["Idea Deliever","Financial","Investing","Communicating","Empathetic"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func editContactAction(_ sender: Any)
    {
        let vc = EditContactDetailsVC.instantiate()
        self.pushVC(controller: vc)
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
extension InvestorAboutTabVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return skillArr.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! skillCell
        cell.lbl.text = skillArr[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! skillCell
        cell.lbl.text = skillArr[indexPath.row]
        cell.lbl.sizeToFit()
        return CGSize(width: cell.lbl.intrinsicContentSize.width + 20, height: 30)
    }
    
}
class skillCell: UICollectionViewCell
{
    @IBOutlet var lbl: UILabel!
    
}
