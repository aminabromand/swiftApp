//
//  LocationInfo.swift
//  SimpleRestaurant
//
//  Created by Amin Abromand on 23.03.19.
//  Copyright © 2019 Amin Abromand. All rights reserved.
//

import UIKit

class LocationInfo: NSObject {
    var finalImageArray = [String]()
    var hours = "10:00 am -10:00 pm"
    var phone = "555-946-34234"
    var website = "https://www.abromand.com"
    //var initialImageStrings = ["burger", "fajitas", "kabob", "nachos", "urubdurub", "pizza", "steak", "tacos", "fajitas2"]
    
    var menuItems: Array<[String:Any]> =
        [
            [
                "title": "Burger",
                "description": "An extraordinary tasty burger",
                "imageStringName": "burger",
                "id": 1
            ],
            [
                "title": "Fajitas",
                "description": "Fajitas so tasty",
                "imageStringName": "fajitas",
                "id": 2
            ],
            [
                "title": "Kabob",
                "description": "that's some nice meat",
                "imageStringName": "kabob",
                "id": 3
            ],
            [
                "title": "Nachos",
                "description": "A snacky snack time",
                "imageStringName": "nachos",
                "id": 4
            ],
            [
                "title": "Pizza",
                "description": "The most delicious pizza in town",
                "imageStringName": "pizza",
                "id": 5
            ],
            [
                "title": "Steak",
                "description": "Best meat on planet earth",
                "imageStringName": "steak",
                "id": 6
            ],
            [
                "title": "Tacos",
                "description": "I am mexican",
                "imageStringName": "tacos",
                "id": 7
            ],
            [
                "title": "Fajitas",
                "description": "I am sooo much mexican",
                "imageStringName": "fajitas2",
                "id": 8
            ],
        ]
    
    var addresses: Array<[String:Any]> = [
            [
                "title": "Druebbelken",
                "address": "Buddenstrasse 14-15, 48143 Münster, Nordrhein-Westfalen, Deutschland",
                "hours": "10:00 am - 10:00 pm",
                "phone": "555-946-34234",
                "website": "https://www.druebbelken.de/",
                "defaultPoint": true,
                "lat": 51.965800,
                "long": 7.622390,
                ],
            [
                "title": "Kleiner Kiepenkerl",
                "address": "Spiekerhof 47, 48143 Münster/Westfalen, Deutschland",
                "hours": "10:00 am - 10:00 pm",
                "phone": "555-946-34234",
                "website": "www.kleiner-kiepenkerl.de/",
                "defaultPoint": false,
                "lat": 51.964320,
                "long": 7.626210
            ],
            [
                "title": "Kleiner Kiepenkerl",
                "address": "Spiekerhof 47, 48143 Münster/Westfalen, Deutschland",
                "hours": "10:00 am - 10:00 pm",
                "phone": "555-946-34234",
                "website": "www.kleiner-kiepenkerl.de/",
                "defaultPoint": false,
                "lat": 51.964320,
                "long": 7.626210
        ],
        ]
    
    required override init(){
        super.init()
        for item in menuItems {
            self.addImageToArray(imageString: item["imageStringName"] as! String)
        }
    }
    
    func getMenuDict() -> Array<[String:Any]> {
        return self.menuItems
    }
    
    func getWebsiteURL() -> NSURL {
        let url: NSURL = NSURL(string: self.website)!
        return url
    }
    
    func getGeneralHours() -> String {
        return self.hours
    }
    
    func getPhone() -> String {
        return self.phone
    }
    
    func getDefaultAddresses() -> Array<[String:Any]> {
        return self.addresses
    }
    
    func getMenuImages() -> Array<String> {
        return self.finalImageArray
    }
    
    func addImageToArray(imageString: String){
        let imageTest = UIImage(named: imageString)
        if (imageTest != nil){
            self.finalImageArray.append(imageString)
        }
    }
}
