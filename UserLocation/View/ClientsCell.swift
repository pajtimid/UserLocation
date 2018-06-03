//
//  ClientsCell.swift
//  UserLocation
//
//  Created by Pajtim on 5/31/18.
//  Copyright © 2018 Pajtim Idrizi. All rights reserved.
//

import UIKit

class ClientsCell: UITableViewCell {
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var City: UILabel!
    @IBOutlet weak var Street: UILabel!
    @IBOutlet weak var ZipCode: UILabel!
    @IBOutlet weak var Telephone: UILabel!
    @IBOutlet weak var Latitude: UILabel!
    @IBOutlet weak var Longitude: UILabel!
    @IBOutlet weak var Suite: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setInfo(_ model: ClientsModel){
        
        self.Name.text = model.Name
        self.City.text = model.City
        self.Street.text  = model.Street
        self.ZipCode.text = model.ZipCode
        self.Telephone.text = model.Telephone
        self.Latitude.text = model.Latitude
        self.Longitude.text = model.Longitude
        self.Suite.text = model.Suite
    }

}
