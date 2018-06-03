//
//  FeedbackVC.swift
//  UserLocation
//
//  Created by Pajtim on 6/2/18.
//  Copyright © 2018 Pajtim Idrizi. All rights reserved.
//

import UIKit
import Alamofire

class FeedbackVC: UIViewController, UITextFieldDelegate {
    
  //  var feedbackArray =  [FeedbackModel]()
    var terminId: Int!
    var visitedId: Int!
    var selectedFeedbackId: Int!
    var scheduleId: Int!
    var blacklistId: Int!
    var beratermusanruffenId: Int!
    var otherId: Int!
    
    var userResponse = [String:Any]()
    
    var buttonIsSelected = false
    var secondSelectedBtn = false
    var thirdSelectedBtn = false
    
    
    
    @IBOutlet weak var hiddenStackView: UIStackView!
    
    @IBOutlet weak var hiddenAktuelleFeedback: UILabel!
    
    @IBOutlet weak var hiddenBlackListLbl: UILabel!
    
    
    @IBOutlet weak var hiddenFolgeterminLbl: UILabel!
    
    @IBOutlet weak var hiddenFlogeterminStackView: UIStackView!
    
    @IBOutlet weak var hiddenFolgeterminAmLbl: UILabel!
    @IBOutlet weak var dataTextField: UITextField!
    @IBOutlet weak var hiddenTimeLbl: UILabel!
    @IBOutlet weak var hiddenDataLbl: UILabel!
    @IBOutlet weak var timeTextField: UITextField!
    
    @IBOutlet weak var hiddenWerMusAnrufenLbl: UILabel!
    @IBOutlet weak var hiddenWerMusAnrufenStackView: UIStackView!
    //
    @IBOutlet weak var krankePersonLbl: UILabel!
    @IBOutlet weak var vertikalKrankePersonToStack: NSLayoutConstraint!
    @IBOutlet weak var kraknkePersonStack: UIStackView!
    @IBOutlet weak var abgeshlosenPersonLbl: UILabel!
    @IBOutlet weak var verticalAbgeshlosenPersonToStack: NSLayoutConstraint!
    @IBOutlet weak var pleaseSelectNrLbl: UILabel!
    @IBOutlet weak var abgeshlosenTxtField: UITextField!
    
    @IBOutlet weak var salesComment: UITextView!
    
    @IBOutlet weak var mussAbhorenLbl: UILabel!
    @IBOutlet weak var verticalMussAbhorenToStack: NSLayoutConstraint!
    @IBOutlet weak var musAbhorenStack: UIStackView!
    @IBOutlet weak var beraterHatVerchobenLbl: UILabel!
    @IBOutlet weak var verticalBeraterhatVerToStack: NSLayoutConstraint!
    @IBOutlet weak var beraterHatVerchobenStack: UIStackView!
    @IBOutlet weak var kundeHatVerchobenLbl: UILabel!
    @IBOutlet weak var verticalkundeHatVerchToStack: NSLayoutConstraint!
    @IBOutlet weak var kundeHatVerchobStack: UIStackView!
    //
    @IBOutlet weak var vertivalFolgeterminToStack: NSLayoutConstraint!
    
 
    @IBOutlet weak var hiddenJaBtn: DLRadioButton!
    @IBOutlet weak var scrollview: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //scrollViewDidScroll(scrollview)
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(FeedbackVC.hideKeyboard))
        
        
        tapGesture.cancelsTouchesInView = false
        
        scrollview.addGestureRecognizer(tapGesture)
        
        self.navigationController?.isNavigationBarHidden = true  //Hide
        
        
     //   self.downloadJsonWithUrl()
        
        // date toolbar
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: self.view.frame.size.height/6, width: self.view.frame.size.width, height: 40.0))
        
        toolBar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)
        
        toolBar.barStyle = UIBarStyle.blackOpaque
        
        toolBar.tintColor = UIColor.white
        
        toolBar.backgroundColor = #colorLiteral(red: 0.3398568034, green: 0.3907825351, blue: 0.4611726999, alpha: 1)
        // time toolbar
        let toolBar2 = UIToolbar(frame: CGRect(x: 0, y: self.view.frame.size.height/6, width: self.view.frame.size.width, height: 40.0))
        
        toolBar2.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)
        
        toolBar2.barStyle = UIBarStyle.blackOpaque
        
        toolBar2.tintColor = UIColor.white
        
        toolBar2.backgroundColor = #colorLiteral(red: 0.3398568034, green: 0.3907825351, blue: 0.4611726999, alpha: 1)
        //
        
        let todayBtn = UIBarButtonItem(title: "Today", style: UIBarButtonItemStyle.plain, target: self, action: #selector(FeedbackVC.tappedToolBarBtn))
        let todayTimeBtn = UIBarButtonItem(title: "Current", style: .plain, target: self, action: #selector (FeedbackVC.tappedTimeToolBarBtn(_:)))
        let okBarBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(FeedbackVC.donePressed))
        
        let okTimeBarBtn = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector (FeedbackVC.doneTimePressed))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: self, action: nil)
        
        toolBar.setItems([todayBtn,flexSpace,flexSpace,flexSpace,okBarBtn], animated: true)
        dataTextField.inputAccessoryView = toolBar
        
        toolBar2.setItems([todayTimeBtn, flexSpace, flexSpace, flexSpace, okTimeBarBtn], animated: true)
        timeTextField.inputAccessoryView = toolBar2
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.isNavigationBarHidden = false  //Hide
        
        
    }
    
    @IBAction func presentStackView(_ sender: DLRadioButton) {
        
        if !buttonIsSelected {
            self.hiddenAktuelleFeedback.frame.origin.y -= 100
            self.hiddenStackView.frame.origin.y -= 100
            self.hiddenAktuelleFeedback.isHidden = false
            self.hiddenStackView.isHidden = false
            buttonIsSelected = true
        } else {
            
        }
        terminId = sender.tag
    }
    
    @IBAction func visitedAction(_ sender: DLRadioButton) {
        visitedId = sender.tag
    }
    @IBAction func blacklistAction(_ sender: DLRadioButton) {
        blacklistId = sender.tag
    }
    
    @IBAction func beraterMusAnruffen(_ sender: DLRadioButton) {
        beratermusanruffenId = sender.tag
    }
    @IBAction func otherBtnPressed(_ sender: DLRadioButton) {
        otherId = sender.tag
    }
    
    
    @IBAction func folgeTerminBtnPressed(_ sender: DLRadioButton) {
        selectedFeedbackId = sender.tag
        
        self.vertivalFolgeterminToStack.constant = 16
        
        self.krankePersonLbl.isHidden = true
        self.kraknkePersonStack.isHidden = true
        self.abgeshlosenPersonLbl.isHidden = true
        self.pleaseSelectNrLbl.isHidden = true
        self.abgeshlosenTxtField.isHidden = true
        self.mussAbhorenLbl.isHidden = true
        self.musAbhorenStack.isHidden = true
        self.beraterHatVerchobenLbl.isHidden = true
        self.beraterHatVerchobenStack.isHidden = true
        self.kundeHatVerchobenLbl.isHidden = true
        self.kundeHatVerchobStack.isHidden = true
        if !secondSelectedBtn {
            self.hiddenAktuelleFeedback.frame.origin.y += 100
            self.hiddenStackView.frame.origin.y += 100
            
            self.hiddenBlackListLbl.isHidden = false
            self.hiddenJaBtn.isHidden = false
            self.hiddenFolgeterminLbl.isHidden = false
            
            
            self.hiddenFlogeterminStackView.isHidden = false
            secondSelectedBtn = true
            self.view.layoutIfNeeded()
            
        } else {}
        
        
    }
    
    @IBAction func folgeterminAmBtnPressed(_ sender: DLRadioButton) {
        scheduleId = sender.tag
        self.hiddenFolgeterminAmLbl.isHidden = false
        self.hiddenDataLbl.isHidden = false
        self.hiddenTimeLbl.isHidden = false
        self.dataTextField.isHidden = false
        self.timeTextField.isHidden = false
        
        hiddenWerMusAnrufenLbl.isHidden = true
        hiddenWerMusAnrufenStackView.isHidden = true
        
        self.view.layoutIfNeeded()
        
    }
    
    @objc func donePressed(_ sender: UIBarButtonItem) {
        dataTextField.resignFirstResponder()
    }
    @objc func doneTimePressed(_ sender: UIBarButtonItem) {
        timeTextField.resignFirstResponder()
    }
    
    @objc func tappedToolBarBtn(_ sender: UIBarButtonItem) {
        
        let dateformatter = DateFormatter()
        
        dateformatter.dateStyle = DateFormatter.Style.medium
        
        dateformatter.timeStyle = DateFormatter.Style.none
        
        dataTextField.text = dateformatter.string(from: Date())
        dataTextField.resignFirstResponder()
    }
    @objc func tappedTimeToolBarBtn(_ sender: UIBarButtonItem) {
        let timeFormatter = DateFormatter()
        timeFormatter.dateStyle = DateFormatter.Style.none
        timeFormatter.timeStyle = DateFormatter.Style.short
        timeTextField.text = timeFormatter.string(from: Date())
        timeTextField.resignFirstResponder()
    }
    
    //    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    //
    //        timeTextField.resignFirstResponder()
    //        dataTextField.resignFirstResponder()
    //        abgeshlosenTxtField.resignFirstResponder()
    //
    //    }
    @objc func hideKeyboard() {
        timeTextField.resignFirstResponder()
        dataTextField.resignFirstResponder()
        abgeshlosenTxtField.resignFirstResponder()
        salesComment.resignFirstResponder()
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
    
    @IBAction func dateTfPressed(_ sender: UITextField) {
        
        let datePickerView: UIDatePicker = UIDatePicker()
        
        //  datePickerView.backgroundColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
        
        datePickerView.datePickerMode = UIDatePickerMode.date
        
        sender.inputView = datePickerView
        
        datePickerView.addTarget(self, action: #selector(FeedbackVC.datePickerValueChanged), for: UIControlEvents.valueChanged)
        
    }
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.medium
        
        dateFormatter.timeStyle = DateFormatter.Style.none
        
        dataTextField.text = dateFormatter.string(from: sender.date)
        
    }
    
    @IBAction func timeTfPressed(_ sender: UITextField) {
        
        let datePickerView: UIDatePicker = UIDatePicker()
        
        datePickerView.datePickerMode = UIDatePickerMode.time
        
        sender.inputView = datePickerView
        
        datePickerView.addTarget(self, action: #selector(FeedbackVC.timePickerValueChanged), for: UIControlEvents.valueChanged)
    }
    
    @objc func timePickerValueChanged(_ sender: UIDatePicker) {
        
        let timeFormatter = DateFormatter()
        
        timeFormatter.dateStyle = DateFormatter.Style.none
        
        timeFormatter.timeStyle = DateFormatter.Style.short
        
        timeTextField.text = timeFormatter.string(from: sender.date)
        
    }
    
    @IBAction func folgeterminAnrufenBtnPressed (_ sender: DLRadioButton) {
        scheduleId = sender.tag
        
        
        hiddenWerMusAnrufenLbl.isHidden = false
        hiddenWerMusAnrufenStackView.isHidden = false
        
        self.hiddenFolgeterminAmLbl.isHidden = true
        self.hiddenDataLbl.isHidden = true
        self.hiddenTimeLbl.isHidden = true
        self.dataTextField.isHidden = true
        self.timeTextField.isHidden = true
        self.view.layoutIfNeeded()
    }
    @IBAction func krankePersonBtnPressed(_ sender: DLRadioButton) {
        selectedFeedbackId = sender.tag
        
        thirdSelectedBtn = true
        
        if hiddenFlogeterminStackView.isHidden == false {
            self.krankePersonLbl.isHidden = false
            self.kraknkePersonStack.isHidden = false
            
            if thirdSelectedBtn {
                self.abgeshlosenPersonLbl.isHidden = true
                self.pleaseSelectNrLbl.isHidden = true
                self.abgeshlosenTxtField.isHidden = true
                self.mussAbhorenLbl.isHidden = true
                self.musAbhorenStack.isHidden = true
                self.beraterHatVerchobenLbl.isHidden = true
                self.beraterHatVerchobenStack.isHidden = true
                self.kundeHatVerchobenLbl.isHidden = true
                self.kundeHatVerchobStack.isHidden = true
                self.vertivalFolgeterminToStack.constant = 140
                
                thirdSelectedBtn = false
            }
            self.view.layoutIfNeeded()
        }
    }
    @IBAction func abgeshlosenPersonBtnPressed(_ sender: DLRadioButton) {
        selectedFeedbackId = sender.tag
        
        thirdSelectedBtn = true
        if hiddenFlogeterminStackView.isHidden == false {
            self.abgeshlosenPersonLbl.isHidden = false
            self.pleaseSelectNrLbl.isHidden = false
            self.abgeshlosenTxtField.isHidden = false
            
            if thirdSelectedBtn {
                self.krankePersonLbl.isHidden = true
                self.kraknkePersonStack.isHidden = true
                self.mussAbhorenLbl.isHidden = true
                self.musAbhorenStack.isHidden = true
                self.beraterHatVerchobenLbl.isHidden = true
                self.beraterHatVerchobenStack.isHidden = true
                self.kundeHatVerchobenLbl.isHidden = true
                self.kundeHatVerchobStack.isHidden = true
                self.vertivalFolgeterminToStack.constant = 150
                thirdSelectedBtn = false
            }
            self.view.layoutIfNeeded()
        }
    }
    @IBAction func offenMussAbklarenBtnPressed(_ sender: DLRadioButton) {
        selectedFeedbackId = sender.tag
        
        thirdSelectedBtn = true
        if hiddenFlogeterminStackView.isHidden == false {
            self.mussAbhorenLbl.isHidden = false
            self.musAbhorenStack.isHidden = false
            if thirdSelectedBtn {
                self.krankePersonLbl.isHidden = true
                self.kraknkePersonStack.isHidden = true
                self.abgeshlosenPersonLbl.isHidden = true
                self.pleaseSelectNrLbl.isHidden = true
                self.abgeshlosenTxtField.isHidden = true
                self.beraterHatVerchobenLbl.isHidden = true
                self.beraterHatVerchobenStack.isHidden = true
                self.kundeHatVerchobenLbl.isHidden = true
                self.kundeHatVerchobStack.isHidden = true
                self.vertivalFolgeterminToStack.constant = 230
                
                thirdSelectedBtn = false
            }
            self.view.layoutIfNeeded()
        }
    }
    @IBAction func beraterHatVerschobenBtnPressed(_ sender: DLRadioButton) {
        selectedFeedbackId = sender.tag
        
        thirdSelectedBtn = true
        if hiddenFlogeterminStackView.isHidden == false {
            self.beraterHatVerchobenLbl.isHidden = false
            self.beraterHatVerchobenStack.isHidden = false
            
            if thirdSelectedBtn {
                self.krankePersonLbl.isHidden = true
                self.kraknkePersonStack.isHidden = true
                self.abgeshlosenPersonLbl.isHidden = true
                self.pleaseSelectNrLbl.isHidden = true
                self.abgeshlosenTxtField.isHidden = true
                self.mussAbhorenLbl.isHidden = true
                self.musAbhorenStack.isHidden = true
                self.kundeHatVerchobenLbl.isHidden = true
                self.kundeHatVerchobStack.isHidden = true
                self.vertivalFolgeterminToStack.constant = 140
                
                thirdSelectedBtn = false
            }
            self.view.layoutIfNeeded()
        }
    }
    @IBAction func kundeHatVerschobenBtnPressed(_ sender: DLRadioButton) {
        selectedFeedbackId = sender.tag
        
        thirdSelectedBtn = true
        if hiddenFlogeterminStackView.isHidden == false {
            self.kundeHatVerchobenLbl.isHidden = false
            self.kundeHatVerchobStack.isHidden = false
            
            if thirdSelectedBtn {
                self.krankePersonLbl.isHidden = true
                self.kraknkePersonStack.isHidden = true
                self.abgeshlosenPersonLbl.isHidden = true
                self.pleaseSelectNrLbl.isHidden = true
                self.abgeshlosenTxtField.isHidden = true
                self.mussAbhorenLbl.isHidden = true
                self.musAbhorenStack.isHidden = true
                self.beraterHatVerchobenLbl.isHidden = true
                self.beraterHatVerchobenStack.isHidden = true
                self.vertivalFolgeterminToStack.constant = 140
                
                thirdSelectedBtn = false
                
            }
            self.view.layoutIfNeeded()
        }
    }

    @IBAction func closeBtnPressed(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func sendAnswers(_ sender: Any) {
        
        let idArray = [terminId, visitedId, selectedFeedbackId, scheduleId, blacklistId, beratermusanruffenId, otherId]
        let idArray1 = idArray.flatMap({ $0 })
        userResponse.updateValue(idArray1, forKey: "FeedbackId")
        //  }
         userResponse.updateValue(abgeshlosenTxtField.text ?? 0, forKey: "Visited times")
        if let salescomment = salesComment.text {
            userResponse.updateValue(salescomment, forKey: "Your impressions")
            
        }
        if let selectedDate = dataTextField.text {
            userResponse.updateValue(selectedDate, forKey: "Date")
        }
        if let selectedTime = timeTextField.text {
            userResponse.updateValue(selectedTime, forKey: "Time")
        }
        
        if let theJSONData = try? JSONSerialization.data(
            withJSONObject: userResponse,
            options: [.prettyPrinted]) {
            let theJSONText = String(data: theJSONData,
                                     encoding: .ascii)
            print("JSON string = \(theJSONText!)")
            
            let urlString = "https://jsonplaceholder.typicode.com/posts"
            let url = URL(string: urlString)!
            let jsonData = theJSONText?.data(using: .utf8, allowLossyConversion: false)!
            
            var request = URLRequest(url: url)
            request.httpMethod = HTTPMethod.post.rawValue
            request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData!
            
            Alamofire.request(request).responseString(completionHandler: { (response) in
                print(response)
                
                self.navigationController?.popViewController(animated: true)

            })
        }
    }
}
