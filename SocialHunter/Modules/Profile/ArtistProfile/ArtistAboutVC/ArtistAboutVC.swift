//
//  ArtistAboutVC.swift
//  SocialHunter
//
//  Created by Apple on 29/10/21.
//

import UIKit

class ArtistAboutVC: UIViewController {
    @IBOutlet var projectCollection: ArtistProjectCollection!
    @IBOutlet var skillCollection: UICollectionView!
    var skillArr = ["Idea Deliever","Financial","Investing","Communicating","Empathetic"]
    override func viewDidLoad() {
        super.viewDidLoad()
        projectCollection.setDataSource()
        registerCell()
        // Do any additional setup after loading the view.
    }
    private func registerCell() {
        projectCollection.registerCell(type: ProjectCVC.self)
    }
    @IBAction func editSkillAction(_ sender: Any)
    {
        let vc = EditSkillsVC.instantiate()
        self.pushVC(controller: vc)
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
extension ArtistAboutVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
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
