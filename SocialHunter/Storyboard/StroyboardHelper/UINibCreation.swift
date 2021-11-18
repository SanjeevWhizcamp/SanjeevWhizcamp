//
//  UINibCreation.swift
//  SocialHunter
//
//  Created by Apple on 12/11/21.
//

import Foundation
class UINibCreation{
    static func loadRecordedDescriptionView()-> RecordedDescriptionView {
      return Bundle.main.loadNibNamed("RecordedDescriptionView", owner:nil, options:nil)![0] as! RecordedDescriptionView
    }
    static func loadDonePopup()-> DonePopup {
      return Bundle.main.loadNibNamed("DonePopup", owner:nil, options:nil)![0] as! DonePopup
    }
    static func loadRecordAgainPopup()-> RecordAgainPopup {
      return Bundle.main.loadNibNamed("RecordAgainPopup", owner:nil, options:nil)![0] as! RecordAgainPopup
    }
    static func loadWithdrawPopup()-> WithdrawPopup {
      return Bundle.main.loadNibNamed("WithdrawPopup", owner:nil, options:nil)![0] as! WithdrawPopup
    }
    static func loadCreateTaskView()-> CreateTaskView {
      return Bundle.main.loadNibNamed("CreateTaskView", owner:nil, options:nil)![0] as! CreateTaskView
    }
    static func loadEmailAddPopup()-> EmailAddPopup {
      return Bundle.main.loadNibNamed("EmailAddPopup", owner:nil, options:nil)![0] as! EmailAddPopup
    }
}
