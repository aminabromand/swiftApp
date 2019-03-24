//
//  LocationCollectionViewCell.swift
//  SimpleRestaurant
//
//  Created by Amin Abromand on 24.03.19.
//  Copyright © 2019 Amin Abromand. All rights reserved.
//

import UIKit

class LocationCollectionViewCell: UICollectionViewCell {
    
    var titleTextView:      UITextView!
    var addressTextView:    UITextView!
    var hoursTextView:      UITextView!
    var phoneTextView:      UITextView!
    var websiteTextView:    UITextView!
    
    required init?(coder aDecoder:NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame:CGRect){
        super.init(frame:frame)
        
        self.backgroundColor = UIColor(white: 1.0, alpha: 0.3)
        
        let tvFrame = CGRect(x: 10, y: 0, width: frame.size.width - 20, height: 50)
        titleTextView = UITextView(frame: tvFrame)
        titleTextView.font = UIFont.boldSystemFont(ofSize: 22.0)
        titleTextView.backgroundColor = UIColor(white: 1.0, alpha: 0.0)
        titleTextView.isScrollEnabled = false
        titleTextView.isEditable = false
        titleTextView.isUserInteractionEnabled = false
        
        let addresstvFrame = CGRect(x: 10, y: 50, width: frame.size.width - 20, height: 50)
        addressTextView = UITextView(frame: addresstvFrame)
        addressTextView.font = UIFont.systemFont(ofSize: 22.0)
        addressTextView.backgroundColor = UIColor(white: 1.0, alpha: 0.0)
        addressTextView.isScrollEnabled = false
        addressTextView.isEditable = false
        addressTextView.isUserInteractionEnabled = false
        
        let hourstvFrame = CGRect(x: 10, y: 100, width: frame.size.width - 20, height: 50)
        hoursTextView = UITextView(frame: hourstvFrame)
        hoursTextView.font = UIFont.systemFont(ofSize: 22.0)
        hoursTextView.backgroundColor = UIColor(white: 1.0, alpha: 0.3)
        hoursTextView.isScrollEnabled = false
        hoursTextView.isEditable = false
        hoursTextView.isUserInteractionEnabled = false
        
        let phonetvFrame = CGRect(x: 10, y: 150, width: frame.size.width - 20, height: 50)
        phoneTextView = UITextView(frame: phonetvFrame)
        phoneTextView.font = UIFont.systemFont(ofSize: 22.0)
        phoneTextView.backgroundColor = UIColor(white: 1.0, alpha: 0.3)
        phoneTextView.isScrollEnabled = false
        phoneTextView.isEditable = false
        phoneTextView.isUserInteractionEnabled = false
        
        let websitetvFrame = CGRect(x: 10, y: 200, width: frame.size.width - 20, height: 50)
        websiteTextView = UITextView(frame: websitetvFrame)
        websiteTextView.font = UIFont.systemFont(ofSize: 22.0)
        websiteTextView.backgroundColor = UIColor(white: 1.0, alpha: 0.3)
        websiteTextView.isScrollEnabled = false
        websiteTextView.isEditable = false
        websiteTextView.isUserInteractionEnabled = false
        
        contentView.addSubview(titleTextView)
        contentView.addSubview(addressTextView)
        contentView.addSubview(hoursTextView)
        contentView.addSubview(phoneTextView)
        contentView.addSubview(websiteTextView)
    }
}
