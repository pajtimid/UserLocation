//
//  SearchVC.swift
//  UserLocation
//
//  Created by Pajtim on 6/2/18.
//  Copyright © 2018 Pajtim Idrizi. All rights reserved.
//

import UIKit
import MapKit

class SearchVC: UIViewController , UITextFieldDelegate {
    
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var segment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false  //Hide
        
        
        addressTextField?.delegate = self
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        let addressGeocoder = CLGeocoder()
        addressGeocoder.geocodeAddressString(addressTextField.text!) { (placemarks, error) in
            
            if error != nil
            {
                print(error)
                return
            }
            
            if let placemarks = placemarks
            {
                let firstPlacemark = placemarks[0]
                let annotation = MKPointAnnotation()
                annotation.title = "Street"
                annotation.subtitle = "No - 83273903"
                
                
                if let location = firstPlacemark.location
                {
                    annotation.coordinate = location.coordinate
                    
                    
                    
                    
                    self.mapView.addAnnotation(annotation)
                    
                    
                    self.mapView.selectAnnotation(annotation, animated: true)
                }
                let region = MKCoordinateRegionMakeWithDistance(annotation.coordinate, 2500, 2500)
                self.mapView.setRegion(region, animated: true)
            }
        }
        
        
        return true
    }
    
    @IBAction func segmentBtnPressed(_ sender: Any) {
        
        if segment.selectedSegmentIndex == 0 {
            mapView.mapType = MKMapType.standard
        }
        if segment.selectedSegmentIndex == 1 {
            mapView.mapType = MKMapType.satellite
        }
        
        if (addressTextField != nil)   {
            
            if (segment.selectedSegmentIndex == 2) {
                
                let addressGeocoder = CLGeocoder()
                addressGeocoder.geocodeAddressString(addressTextField.text!) { (placemarks, error) in
                    
                    if error != nil
                    {
                        print(error)
                        return
                    }
                    
                    if let placemarks = placemarks
                    {
                        let firstPlacemark = placemarks[0]
                        let annotation = MKPointAnnotation()
                        
                        
                        if let location = firstPlacemark.location
                        {
                            
                            annotation.coordinate = location.coordinate
                            
                            let region = MKCoordinateRegionMakeWithDistance(annotation.coordinate, 150 , 150)
                            self.mapView.setRegion(region, animated: true)
                        }
                    }
                }
            }
        }
            
            
        else {
            return
        }
        
        
        
        
        
    }
    
}
