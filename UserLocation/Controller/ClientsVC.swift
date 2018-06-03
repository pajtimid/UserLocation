//
//  ClientsVC.swift
//  UserLocation
//
//  Created by Pajtim on 5/31/18.
//  Copyright © 2018 Pajtim Idrizi. All rights reserved.
//

import UIKit

class ClientsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var posts:[ClientsModel] = [ClientsModel]()

    @IBOutlet weak var menuButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
            
            self.initPosts()
        }
    }
    func initPosts(){
        
        self.posts.removeAll()
        
        NetworkServices.getPosts { (success, data, error) in
            if success {
                print(data)
                if  let postetArray = data.array{
                
                for item in postetArray {
                    let post = ClientsModel(item)
                    
                    self.posts.append(post)
                }
                    
                }
            }
            
            self.tableView.reloadData()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ClientsCell {
            let post = posts[indexPath.row]
            cell.setInfo(post)
            return cell
        } else {
            return ClientsCell()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let VC = self.storyboard?.instantiateViewController(withIdentifier: "DetailsVC") as? DetailsVC {
            if indexPath.row >= 0 {
                let post = posts[indexPath.row]
                VC.parsingData(post)
                self.navigationController?.pushViewController(VC, animated: true)
            }
        }
    }
  
}
