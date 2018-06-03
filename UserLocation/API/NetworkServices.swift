//
//  NetworkServices.swift
//  UserLocation
//
//  Created by Pajtim on 5/31/18.
//  Copyright © 2018 Pajtim Idrizi. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class NetworkServices: NSObject {
    
    class func loginWith(username: String, password: String, completionHandler: @escaping (_ success: Bool, _ data: JSON, _ error: Error?) -> Void){
        
        let credentials = "\(username):\(password)"
        let encodedCredentials = (credentials).data(using: String.Encoding.utf8)
        let  base64 = encodedCredentials!.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
        
       
        NetworkLayer.makeGetRequest(linkURL: URL(string: "https://jsonplaceholder.typicode.com/users")! as NSURL, parameters: nil, headers:["Authorization": "Basic \(base64)"])
        {
            (success, jsonData, error) in
            if success{
                completionHandler(true, JSON(jsonData!), nil)
            }else{
                
                completionHandler(false, JSON.null, error)
            }
        }
    }
    class func getPosts(completionHandler: @escaping (_ success: Bool, _ data: JSON, _ error: Error?) -> Void){
        
        
        let path = "https://jsonplaceholder.typicode.com/users".removingWhitespaces()
        let linkURLRequest = NSURL(string: path, relativeTo: Constants.baseURL)!
        
        NetworkLayer.makeGetRequest(linkURL: linkURLRequest, parameters: nil, headers:nil) { (success, jsonData, error) in
            
            if success{
                completionHandler(true, JSON(jsonData!), nil)
                print(JSON(jsonData!))
            }else{
                completionHandler(false, nil, error)
                
            }
        }
    }
    


}
