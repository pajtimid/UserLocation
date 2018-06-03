//
//  LoginVC.swift
//  UserLocation
//
//  Created by Pajtim on 5/31/18.
//  Copyright © 2018 Pajtim Idrizi. All rights reserved.
//

import UIKit

class LoginVC: UIViewController , UITextFieldDelegate, UIActionSheetDelegate {
    
    
    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    var isGranted = false
    
    let messageFrame = UIView()
    var activityIndicator = UIActivityIndicatorView()
    var strLabel = UILabel()
    let effectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
    

    override func viewDidLoad() {
        super.viewDidLoad()
        txtUsername.delegate = self
        txtPassword.delegate = self

        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginVC.dismissKeyboard))
        self.view.addGestureRecognizer(tap);

        
    }
    
    func activityIndicator(_ title: String) {
        
        strLabel.removeFromSuperview()
        activityIndicator.removeFromSuperview()
        effectView.removeFromSuperview()
        
        strLabel = UILabel(frame: CGRect(x: 50, y: 0, width: 200, height: 46))
        strLabel.text = title
        strLabel.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)
        strLabel.textColor = UIColor(white: 0.9, alpha: 0.7)
        
        effectView.frame = CGRect(x: view.frame.midX - strLabel.frame.width/2, y: view.frame.midY - strLabel.frame.height/2 , width: 200, height: 46)
        effectView.layer.cornerRadius = 15
        effectView.layer.masksToBounds = true
        
        activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .white)
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 46, height: 46)
        activityIndicator.startAnimating()
        
        effectView.contentView.addSubview(activityIndicator)
        effectView.contentView.addSubview(strLabel)
        view.addSubview(effectView)
    }
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        
        if  (txtUsername.text?.isEmpty)! && (txtUsername.text?.isEmpty)!{

            self.showWrongMessage()
            return false;
        }
        else if txtUsername.text == " " && txtPassword.text == " "{
           
            self.showWrongMessage()
            return false;
            
        }
        else{
            if (!isGranted) {
                DispatchQueue.main.async(){
                    self.activityIndicator("Authenticating...");
                }
                
                NetworkServices.loginWith(username: self.txtUsername.text!, password: self.txtPassword.text!, completionHandler: { (success, data, error) in
                    if !success {
                        self.isGranted = false
                        
                        self.activityIndicator("Authenticating...")
                        self.showWrongMessage()
                        self.effectView.removeFromSuperview()
                    } else {

                        AppData.saveUserName(self.txtUsername.text!)
                        AppData.saveUserPassword(self.txtPassword.text!)
                        
                       // self.performSegue(withIdentifier: "LoginRelation", sender: self)
                        self.isGranted = true
                        self.effectView.removeFromSuperview()

                    }
                })
                
            }
            
        }
        
        return true;
        
        //   return isGranted
        
    }
    
    func showWrongMessage()
    {
        let alertController = UIAlertController(title: "Error", message: "Wrong username/password. Please try again.", preferredStyle: .alert)
        let cancelButton = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        
        alertController.addAction(cancelButton)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField == txtUsername {
            txtPassword.becomeFirstResponder()
        }
        return true
    }
    
    @objc func dismissKeyboard() {
        
        view.endEditing(true)
    }
}
