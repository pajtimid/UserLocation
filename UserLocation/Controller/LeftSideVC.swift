//
//  LeftSideVC.swift
//  UserLocation
//
//  Created by Pajtim on 5/31/18.
//  Copyright © 2018 Pajtim Idrizi. All rights reserved.
//

import UIKit

class LeftSideVC: UITableViewController {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var logoutCell: UITableViewCell!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameLbl.text = AppData.getUserName()

        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 70
//        if logoutCell.isSelected {
//            AppData.clear()
//        }
        
    }
    
    @IBAction func logoutPressed(_ sender: Any) {
       
        AppData.clear()

        self.dismiss(animated: true, completion: nil)
       // self.navigationController?.popViewController(animated: true)
        
    }
    
}
