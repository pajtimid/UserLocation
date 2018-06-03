//
//  NetworkLayer.swift
//  UserLocation
//
//  Created by Pajtim on 5/31/18.
//  Copyright © 2018 Pajtim Idrizi. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class NetworkLayer: NSObject {

    class func makeGetRequest(linkURL: NSURL, parameters: Parameters?, headers: HTTPHeaders?, completionHandler: @escaping (_ success: Bool, _ jsonData: Any?, _ error: Error?) -> Void){
        
        let request = Alamofire.request(linkURL.absoluteString!, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers)
        request
            .validate()
            .responseJSON{
                response in
                switch response.result
                {
                case .success(let jsonData):
                    
                    completionHandler(true, jsonData, nil)
                    break
                case .failure(let err):
                    
                    completionHandler(false, nil, err)
                    break
                }
        }
    }
    
    class func makePostRequest(linkURL: NSURL, parameters: Parameters?, headers: HTTPHeaders?, completionHandler: @escaping (_ success: Bool, _ jsonData: Any?, _ error: Error?) -> Void){
        
        let request = Alamofire.request(linkURL.absoluteString!, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers)
        request
            .validate()
            .responseJSON{
                response in
                switch response.result{
                    
                case .success(let jsonData):
                    
                    completionHandler(true, jsonData, nil)
                    break
                case .failure(let err):
                    
                    completionHandler(false, nil, err)
                    break
                }
        }
    }
    
}
