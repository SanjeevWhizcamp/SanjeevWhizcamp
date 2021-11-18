//
//  VerifyNumberVC.swift
//  Social Hunter
//
//  Created by Manpreet on 24/08/21.
//

import UIKit
import OTPFieldView

class VerifyNumberVC: UIViewController, OTPFieldViewDelegate {

    @IBOutlet var otpTextFieldView: OTPFieldView!
    var counter = 45
    var timer = Timer()
    @IBOutlet weak var timer_lbl: UILabel!
    var otpSt = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        otpTextFieldView.delegate = self
        setupOtpView()
        setTimer()
    }
    func setTimer()
    {
        timer.invalidate() // just in case this button is tapped multiple times

                // start the timer
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    @objc func timerAction() {
        if counter > 0
        {
            counter -= 1
        timer_lbl.text = "0:\(counter)"
        }
        }
    @IBAction func resendAction(_ sender: Any)
    {
       counter = 45
        setTimer()
    }
    @IBAction func didTapBack(_ sender: Any) {
        self.popVC()
    }
    
    @IBAction func didTapVerifyNumber(_ sender: Any) {
        if otpSt.count == 4
        {
        let vc = ArtistSelectionVC.instantiate()
        self.pushVC(controller: vc)
        }
        else
        {
            self.showMessage(AppMessages.validOtp)
        }
    }
    
    func setupOtpView(){
        self.otpTextFieldView.fieldsCount = 4
        self.otpTextFieldView.fieldBorderWidth = 0
        self.otpTextFieldView.defaultBackgroundColor = UIColor(named: "PhoneVerify") ?? .clear
        self.otpTextFieldView.filledBackgroundColor = UIColor(named: "PhoneVerify") ?? .clear
        self.otpTextFieldView.cursorColor = UIColor.black
        self.otpTextFieldView.displayType = .roundedCorner
        self.otpTextFieldView.separatorSpace = 25
        self.otpTextFieldView.otpInputType = .numeric
        self.otpTextFieldView.shouldAllowIntermediateEditing = false
        self.otpTextFieldView.tintColor = UIColor.label
        self.otpTextFieldView.initializeUI()
    }
    
    func shouldBecomeFirstResponderForOTP(otpTextFieldIndex index: Int) -> Bool {
        return true
    }
    
    func enteredOTP(otp: String) {
        print("OTPString: \(otp)")
        otpSt = otp
    }
    
    func hasEnteredAllOTP(hasEnteredAll: Bool) -> Bool {
        print(hasEnteredAll)
        if hasEnteredAll == false
        {
            otpSt = ""
        }
        return true
    }
    


}
