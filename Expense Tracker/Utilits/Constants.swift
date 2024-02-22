//
//  Constants.swift
//  Expensiv Tracker
//
//  Created by Abdirizak Hassan on 3/1/22 💻.
//  Copyright © 2023 Abdirizak Hassan DR X. All Rights Reserved.
//
// GitHub: https://github.com/abdorizak
// Website: https://abdorizak.dev

import UIKit


struct API {
    // if you want to run on you Real Device use same network and put here your computer IP.
    static let baseURL = "https://expensetracker.abdorizak.dev/api/v1/"
}

extension UserDefaults {
    
    private enum userDefaultsKeys: String {
        case hasOnboarded
    }
    
    var hasOnboarded: Bool {
        get {
            bool(forKey: userDefaultsKeys.hasOnboarded.rawValue)
        }
        set {
            setValue(newValue, forKey: userDefaultsKeys.hasOnboarded.rawValue)
        }
    }
}

enum Images {
    static let placeHolderImage      = UIImage(named: "placeholder-profile")
    static let aboutUS_ExpenseImage  = UIImage(named: "Expense_Backgroud")
    static let usernameIcon          = UIImage(named: "username_icon")
    static let passwordIcon          = UIImage(named: "password_icon")
    static let login_Image           = UIImage(named: "Login_logo")
    static let singup_Image          = UIImage(named: "singUp")
    static let forgetpassword_Image  = UIImage(named: "Forgetpass")
    
    static let edityourProfile       = UIImage(systemName: "slider.horizontal.3")
    static let changePassword        = UIImage(systemName: "key.fill")
    static let userStatementIcon     = UIImage(systemName: "newspaper.fill")
    
    static let enableAuth            = UIImage(systemName: "faceid")
    
    static let aboutUs               = UIImage(systemName: "hand.point.up.braille.fill")
    static let logout                = UIImage(systemName: "rectangle.portrait.and.arrow.right.fill")
    
    static let spending_Money        = UIImage(named: "spending_money")
    static let login_pin_background  = UIImage(named: "login_withPin_img")
}

enum DeviceTypes {
    enum ScreenSize {
        static let width                = UIScreen.main.bounds.size.width
        static let height               = UIScreen.main.bounds.size.height
        static let maxLength            = max(ScreenSize.width, ScreenSize.height)
        static let minLength            = min(ScreenSize.width, ScreenSize.height)
    }
    
    static let idiom                    = UIDevice.current.userInterfaceIdiom
    static let nativeScale              = UIScreen.main.nativeScale
    static let scale                    = UIScreen.main.scale
    
    static let isiPhoneSE               = idiom == .phone && ScreenSize.maxLength == 667.0
    static let isiPhone8Standard        = idiom == .phone && ScreenSize.maxLength == 667.0 && nativeScale == scale
    static let isiPhone8Zoomed          = idiom == .phone && ScreenSize.maxLength == 667.0 && nativeScale > scale
    static let isiPhone8PlusStandard    = idiom == .phone && ScreenSize.maxLength == 736.0
    static let isiPhone8PlusZoomed      = idiom == .phone && ScreenSize.maxLength == 736.0 && nativeScale > scale
    static let isiPhoneX                = idiom == .phone && ScreenSize.maxLength == 812.0
    static let isiPhonePro              = idiom == .phone && ScreenSize.maxLength == 812.0
    static let isiPhone14Pro            = idiom == .phone && ScreenSize.maxLength == 852.0
    static let isiPhoneMini             = idiom == .phone && ScreenSize.maxLength == 812.0
    static let isiPhoneXsMaxAndXr       = idiom == .phone && ScreenSize.maxLength == 896.0
    static let isiPhone11               = idiom == .phone && ScreenSize.maxLength == 896.0
    static let isiPad                   = idiom == .pad && ScreenSize.maxLength >= 1024.0
    
    static func isiPhoneXAspectRatio() -> Bool {
        return isiPhoneX || isiPhoneXsMaxAndXr
    }
}

