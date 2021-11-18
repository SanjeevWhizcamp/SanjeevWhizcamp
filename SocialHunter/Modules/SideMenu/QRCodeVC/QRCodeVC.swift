//
//  QRCodeVC.swift
//  SocialHunter
//
//  Created by Apple on 16/11/21.
//

import UIKit
import AVFoundation
import MercariQRScanner

class QRCodeVC: UIViewController {

    @IBOutlet var qrScannerView: UIView!
    @IBOutlet var qrView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        qrView.isHidden = true
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    @IBAction func scanQrAction(_ sender: Any)
    {
        qrView.isHidden = false
        let qrScannerView = QRScannerView(frame: qrScannerView.bounds)
        qrView.addSubview(qrScannerView)
        qrScannerView.configure(delegate: self)
        qrScannerView.startRunning()
    }
    @IBAction func backAction(_ sender: Any)
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
extension QRCodeVC: QRScannerViewDelegate
{
    func qrScannerView(_ qrScannerView: QRScannerView, didFailure error: QRScannerError) {
            print(error)
        }

        func qrScannerView(_ qrScannerView: QRScannerView, didSuccess code: String) {
            print(code)
        }
}
