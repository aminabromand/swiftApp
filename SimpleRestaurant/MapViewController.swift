//
//  LocationViewController.swift
//  SimpleRestaurant
//
//  Created by Amin Abromand on 23.03.19.
//  Copyright © 2019 Amin Abromand. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    var defaultPoint: MKPointAnnotation?
    var addresses: Array<[String:Any]>?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let map = MKMapView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        map.delegate = self
        
        self.addresses = LocationInfo().getDefaultAddresses()
        
        if self.addresses != nil {
            for adde in addresses! {
                let point = MKPointAnnotation()
                point.coordinate = CLLocationCoordinate2D(latitude: adde["lat"] as! Double, longitude: adde["long"] as! Double)
                point.title = adde["title"] as? String
                point.subtitle = adde["address"] as? String
                map.addAnnotation(point)
                
                if (adde["defaultPoint"] as! Bool) {
                    self.defaultPoint = MKPointAnnotation()
                    self.defaultPoint!.coordinate = CLLocationCoordinate2D(latitude: adde["lat"] as! CLLocationDegrees, longitude: adde["long"] as! CLLocationDegrees)
                    self.defaultPoint!.title = adde["title"] as? String
                    self.defaultPoint!.subtitle = adde["address"] as? String
                }
            }
        }
        
        if (self.defaultPoint != nil){
            map.addAnnotation(self.defaultPoint!)
            var region = map.region as MKCoordinateRegion
            region.center = self.defaultPoint!.coordinate
            region.span.latitudeDelta = 0.020
            region.span.longitudeDelta = 0.020
            
            map.selectAnnotation(self.defaultPoint!, animated: false)
            map.setRegion(region, animated: true)
        }
        
        
        self.view.addSubview(map)
    }
    
    // MARK: - Map Related
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let reuseID = "pin"
        var anno = mapView.dequeueReusableAnnotationView(withIdentifier: reuseID) as? MKPinAnnotationView
        if (anno == nil){
            anno = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseID)
            anno!.pinTintColor = UIColor.purple
            anno!.canShowCallout = true
            anno!.animatesDrop = true
            
            let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 150.0, height: anno!.bounds.height))
            btn.setTitle("Directions", for: UIControl.State.normal)
            btn.backgroundColor = UIColor.black
            
            btn.addTarget(self, action: #selector(buttonTouched), for: .touchUpInside)
            btn.tag = 1
            
            let pointTitle = anno!.annotation!.title!
            
            if self.addresses != nil {
                var i = 0
                for adde in addresses! {
                    if (pointTitle == adde["title"] as? String) {
                        btn.tag = i
                        break
                    }
                    i += 1
                }
            }
            
//            switch pointTitle{
//            case "Druebbelken":
//                btn.tag = 1
//            case "Kleiner Kiepenkerl":
//                btn.tag = 2
//            default:
//                btn.tag = 1
//            }
            
            anno!.rightCalloutAccessoryView = btn
            //anno!.leftCalloutAccessoryView = btn
        }
        return anno
    }
    
    @objc func buttonTouched(sender: UIButton) {
        //let appleMapString = "http://maps.apple.com/?q="
        let googleMapString = "http://maps.google.com/?daddr="
        
        let tagIs = sender.tag as Int
        
        var urlAdd: String?
        
//        switch tagIs{
//        case 1:
//            urlAdd = self.address
//        case 2:
//            urlAdd = self.address2
//        default:
//            urlAdd = self.address
//        }
        
        urlAdd = self.addresses![tagIs]["address"] as? String

        //let addressString = urlAdd!.replacingOccurrences(of: " ", with: "+", options: NSString.CompareOptions.literal, range: nil)
        let addressString = urlAdd!.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        
        let mapURLString = googleMapString + addressString!
        let mapURL = NSURL(string: mapURLString)

        UIApplication.shared.open(mapURL! as URL)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
