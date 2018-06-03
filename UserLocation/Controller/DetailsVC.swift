//
//  DetailsVC.swift
//  UserLocation
//
//  Created by Pajtim on 6/2/18.
//  Copyright © 2018 Pajtim Idrizi. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var telephoneLbl: UILabel!
    
    var nameString:String?
    var addressString:String?
    var telephoneString:String?
    var lat:String?
    var lon:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = UIColor.white

        updateUI()
    }
    
    func updateUI(){
        
        self.nameLbl.text = nameString
        self.addressLbl.text = addressString
        self.telephoneLbl.text = telephoneString
        
    }
    func parsingData(_ model: ClientsModel){
        let address = "\(model.Suite!) \(model.Street!) \(model.City!)"
        self.nameString = model.Name
        self.addressString = address
        self.telephoneString = model.Telephone
        self.lat = model.Latitude
        self.lon = model.Longitude
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! LocationVC
        
        destinationVC.stringLat = lat
        destinationVC.stringLon = lon
        destinationVC.stringHiddenName = nameString
        
    }
    @IBAction func feedbackPressed(_ sender: Any) {
        
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "FeedbackVC") as! FeedbackVC
        
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
}
