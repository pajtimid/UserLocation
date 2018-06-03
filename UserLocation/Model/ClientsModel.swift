//
//  ClientsModel.swift
//  UserLocation
//
//  Created by Pajtim on 5/31/18.
//  Copyright © 2018 Pajtim Idrizi. All rights reserved.
//

import UIKit
import SwiftyJSON

class ClientsModel: NSObject {

    var Name: String?
    var City:String?
    var Latitude:String?
    var ZipCode: String?
    var Street:String?
    var Telephone:String?
    var Suite:String?
    var Longitude:String?
    
    override init() {
        
    }
    init(_ name: String, _ surname:String, _ date:String, _ zipCode:String, _ address:String, _ telephone:String, _ id:String, _ time:String){
    
        self.Name = name
        self.City = surname
        self.Latitude = date
        self.ZipCode = zipCode
        self.Street = address
        self.Telephone = telephone
        self.Suite = id
        self.Longitude = time
    }
    init(_ jsonData:JSON) {
        
        self.Name = jsonData["name"].string
        self.City = jsonData["address"]["city"].string
        self.Latitude = jsonData["address"]["geo"]["lat"].string
        self.ZipCode = jsonData["address"]["zipcode"].string
        self.Street = jsonData["address"]["street"].string
        self.Telephone = jsonData["phone"].string
        self.Suite = jsonData["address"]["suite"].string
        self.Longitude = jsonData["address"]["geo"]["lng"].string
    }
}
