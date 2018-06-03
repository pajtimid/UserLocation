//
//  LocationVC.swift
//  UserLocation
//
//  Created by Pajtim on 6/2/18.
//  Copyright © 2018 Pajtim Idrizi. All rights reserved.
//

import UIKit
import MapKit

class LocationVC: UIViewController , CLLocationManagerDelegate,MKMapViewDelegate {
    
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var distanceLbl: UILabel!
    @IBOutlet weak var segmetBtn: UISegmentedControl!
    @IBOutlet weak var latLbl: UILabel!
    
    @IBOutlet weak var hiddenNameLbl: UILabel!
    @IBOutlet weak var lonLbl: UILabel!
    @IBOutlet weak var directionBtn: UIButton!
    
    
    var stringLat:String!
    var stringHiddenName:String!
    var stringLon:String!
    
    
    
    var locationManager: CLLocationManager = CLLocationManager()
    
    var oldLocation: CLLocation!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false  //Hide
        
        
        self.title = "My location"
        
        oldLocation = nil
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        // locationManager.requestLocation()
        locationManager.distanceFilter = 10 //distanca qe e nrron lokacionin eshte 10 metra
        
        mapView.showsUserLocation = true
        mapView.delegate = self
        
        self.latLbl.text = stringLat
        self.hiddenNameLbl.text = stringHiddenName
        self.lonLbl.text = stringLon
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //  let location = locations[0]
        let region = MKCoordinateRegionMakeWithDistance((locations.last?.coordinate)!, 1500, 1500)
        
        mapView.setRegion(region, animated: true)
        print((locations.last?.coordinate)!)
        
        if oldLocation == nil {
            oldLocation = locations.first //njejt si locations[0]
        }
        let newLocation = locations.last
        let distance = newLocation?.distance(from: oldLocation)
        
        if let distance = distance {
            distanceLbl.text = String(format: "%0.1f meters", distance)
        }
        //  print(location)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    @IBAction func segmentBtnPressed(_ sender: Any) {
        
        if segmetBtn.selectedSegmentIndex == 0 {
            directionBtn.setTitleColor(#colorLiteral(red: 0.2455386519, green: 0.3189581335, blue: 0.7113724351, alpha: 1), for: UIControlState.normal)
            mapView.mapType = MKMapType.standard
        }
        if segmetBtn.selectedSegmentIndex == 1 {
            directionBtn.setTitleColor(UIColor.white, for: UIControlState.normal)
            mapView.mapType = MKMapType.satellite
        }
        if segmetBtn.selectedSegmentIndex == 2 {
            let userLocation = mapView.userLocation
            if let location = userLocation.location {
            let region = MKCoordinateRegionMakeWithDistance(
                location.coordinate, 2000, 2000)
            
            mapView.setRegion(region, animated: true)
            }
        }
        if segmetBtn.selectedSegmentIndex == 3 {
            //            let searchVC = self.storyboard?.instantiateViewController(withIdentifier: "SearchVC")
            //            self.present(searchVC!, animated: true, completion: nil)
            self.performSegue(withIdentifier: "Search", sender: self)
        }
    }
    //
    
    
    // if user location is changed
    func mapView(_ mapView: MKMapView, didUpdate
        userLocation: MKUserLocation) {
        mapView.centerCoordinate = userLocation.location!.coordinate
    }
    
    @IBAction func directionBtnPressed(_ sender: Any) {
        
        //
        self.latLbl.isHidden = false
        self.latLbl.text = stringLat
        
        self.hiddenNameLbl.text = stringHiddenName
        self.lonLbl.text = stringLon
        
        let latitude = Double(stringLat)
        let longitude = Double(stringLon)
        
        guard let country = latLbl.text else { return }
        let address = "\(country)"
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address)  {
            placemarks, error in
            let placemark = placemarks?.first
            let lat = placemark?.location?.coordinate.latitude
            let lon = placemark?.location?.coordinate.longitude
            print("Lat: \(String(describing: lat)), Lon: \(String(describing: lon))")
         
            let regionDistance:CLLocationDistance = 1000;
            
       //     let coordinates = CLLocationCoordinate2D(latitude: lat!, longitude: lon!)//longitude)
            
            let coordinates = CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!)//longitude)

            
            let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
            
            let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
            
            let placemark2 = MKPlacemark(coordinate: coordinates)
            let mapItem = MKMapItem(placemark: placemark2)
            mapItem.name = "\(self.hiddenNameLbl.text!) \(self.lonLbl.text!)"
            
            mapItem.openInMaps(launchOptions: options)
            
        }
    }
    
}
