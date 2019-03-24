//
//  LocationItemViewController.swift
//  SimpleRestaurant
//
//  Created by Amin Abromand on 24.03.19.
//  Copyright © 2019 Amin Abromand. All rights reserved.
//

import UIKit

class LocationItemViewController: UIViewController {

    var locationTitleText: String = ""
    var addressText: String = ""
    var hoursText: String = ""
    var phoneText: String = ""
    var websiteText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .white
        
        let tvFrame = CGRect(x: 0, y: 100, width: self.view.frame.size.width, height: 50)
        let titleTextView = UITextView(frame: tvFrame)
        titleTextView.font = UIFont.boldSystemFont(ofSize: 22.0)
        titleTextView.backgroundColor = UIColor(white: 1.0, alpha: 0.3)
        titleTextView.isScrollEnabled = false
        titleTextView.isEditable = false
        titleTextView.isUserInteractionEnabled = false
        titleTextView.text = self.locationTitleText
        
        let addresstvFrame = CGRect(x: 0, y: 150, width: self.view.frame.size.width, height: 50)
        let addressTextView = UITextView(frame: addresstvFrame)
        addressTextView.font = UIFont.systemFont(ofSize: 22.0)
        addressTextView.backgroundColor = UIColor(white: 1.0, alpha: 0.3)
        addressTextView.isScrollEnabled = false
        addressTextView.isEditable = false
        addressTextView.isUserInteractionEnabled = false
        addressTextView.text = self.addressText
        
        let hourstvFrame = CGRect(x: 0, y: 200, width: self.view.frame.size.width, height: 50)
        let hoursTextView = UITextView(frame: hourstvFrame)
        hoursTextView.font = UIFont.systemFont(ofSize: 22.0)
        hoursTextView.backgroundColor = UIColor(white: 1.0, alpha: 0.3)
        hoursTextView.isScrollEnabled = false
        hoursTextView.isEditable = false
        hoursTextView.isUserInteractionEnabled = false
        hoursTextView.text = self.hoursText
        
        let phonetvFrame = CGRect(x: 0, y: 250, width: self.view.frame.size.width, height: 50)
        let phoneTextView = UITextView(frame: phonetvFrame)
        phoneTextView.font = UIFont.systemFont(ofSize: 22.0)
        phoneTextView.backgroundColor = UIColor(white: 1.0, alpha: 0.3)
        phoneTextView.isScrollEnabled = false
        phoneTextView.isEditable = false
        phoneTextView.isUserInteractionEnabled = false
        phoneTextView.text = self.phoneText
        
        let websitetvFrame = CGRect(x: 0, y: 300, width: self.view.frame.size.width, height: 50)
        let websiteTextView = UITextView(frame: websitetvFrame)
        websiteTextView.font = UIFont.systemFont(ofSize: 22.0)
        websiteTextView.backgroundColor = UIColor(white: 1.0, alpha: 0.3)
        websiteTextView.isScrollEnabled = false
        websiteTextView.isEditable = false
        websiteTextView.isUserInteractionEnabled = false
        websiteTextView.text = self.websiteText
        

        self.view.addSubview(titleTextView)
        self.view.addSubview(addressTextView)
        self.view.addSubview(hoursTextView)
        self.view.addSubview(phoneTextView)
        self.view.addSubview(websiteTextView)
        
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
