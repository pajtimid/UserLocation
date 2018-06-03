//
//  AppData.swift
//  SmartVoip
//
//  Created by Pajtim on 4/30/18.
//  Copyright © 2018 Pajtim Idrizi. All rights reserved.
//

import UIKit

class AppData: NSObject {
    
    
    static let shared = AppData()
    
    static let KEY_USER_NAME = "user_name"
    static let KEY_USER_PASSWORD = "user_password"
  
    
    class func saveUserName(_ userName: String)
    {
        UserDefaults.standard.set(userName, forKey: AppData.KEY_USER_NAME)
        UserDefaults.standard.synchronize()
    }
    
    class func saveUserPassword(_ userPassword: String)
    {
        UserDefaults.standard.set(userPassword, forKey: AppData.KEY_USER_PASSWORD)
        UserDefaults.standard.synchronize()
    }

    
    class func getUserName() -> String{
        if(UserDefaults.standard.string(forKey: AppData.KEY_USER_NAME) != nil){
            return UserDefaults.standard.string(forKey: AppData.KEY_USER_NAME)!
        }
        
        return ""
    }
    
    class func getUserPassword() -> String{
        
        if (UserDefaults.standard.string(forKey: AppData.KEY_USER_PASSWORD) != nil)
        {
            return UserDefaults.standard.string(forKey: AppData.KEY_USER_PASSWORD)!
            
        }
        return ""
    }
 
    static func clear(){
        let appDomain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: appDomain)
    }
}
