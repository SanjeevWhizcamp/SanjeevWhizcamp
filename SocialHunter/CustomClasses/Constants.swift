//
//  Constants.swift
//  SocialHunter
//
//  Created by Apple on 25/10/21.
//

import Foundation
import UIKit
struct AppMessages {
    static let fullName = "Enter full name"
    static let emailId = "Enter business email id"
    static let password = "Enter password"
    static let phoneNumber = "Enter phone number"
    static let validEmail = "Enter valid email id"
    static let validOtp = "Enter valid OTP"
}
struct mapArr
{
    static let nameArr = ["Liza Roy","Whizcamp","Bonny Bennit"]
    static let roleArr = ["Artist","Organization","Artist"]
    static let imgArr = ["dummy-Proile","dummy-Proile","dummy-Proile"]
    static let roleImgArr = ["ArtistGray","OrgaisationGray","ArtistGray"]
}
enum MessageSide {
    case left
    case right
}

struct Message {
    var text = ""
    var image = UIImage()
    var side: MessageSide = .right
}
struct artistNotification
{
    static let notificationArr = ["Naina Roy Upload new idea check it out.","Your Pitch has been approved by Jason Doe.","Liam Payne proposed new estimates.","John Doe has invited you to make a pitch on UX Designs.","Congratulations! Whizcamp paid you for Working on First Revision."]
}
struct sidemenu{
    static let arr = ["Projects","Your Activity","QR Code","Saved","Setting"]
    static let imgArr = ["ProjectMenu","ActivityMenu","QRCodeWhite","SavedMenu","Setting"]
}
struct setting{
    static let settingNameArr = ["Account preferences","Sign in & security","Help Center","Terms & Conditions"]
    static let settingDescArr = ["The basics of your profile, skills and projects","Options and controls for signing in and keeping your account safe.","Concerned about safety.","A terms and conditions agreement is essentially a legal contract that outlines the rules that visitors must abide by when using a website or app."]
    static let imgArr = ["SettingAccount","SettingSignin","SettingHelp","SettingTerms"]
}
struct SigninSecurity
{
    static let nameArr = ["Email","Phone Number","Change Password"]
    static let descArr = ["Add or remove email addresses on your account","Add a phone number in case you have trouble signing in","Choose a unique password to protect your account"]
}
struct HelpCenter{
    static let heplArr = ["Change or add email address","Reset your Password","Close your account","Merge connections from two accounts"]
}
