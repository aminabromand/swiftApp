//
//  CustomCollectionViewCell.swift
//  SimpleRestaurant
//
//  Created by Amin Abromand on 24.03.19.
//  Copyright © 2019 Amin Abromand. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    var textView:UITextView!
    var imageView:UIImageView!
    
    required init?(coder aDecoder:NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame:CGRect){
        super.init(frame:frame)
        
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        
        contentView.addSubview(imageView)
        
        let tvFrame = CGRect(x: 0, y: frame.size.height * 1/2, width: frame.size.width, height: frame.size.height * 1/3)
        textView = UITextView(frame: tvFrame)
        textView.font = UIFont.systemFont(ofSize: 22.0)
        textView.backgroundColor = UIColor(white: 1.0, alpha: 0.3)
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.isUserInteractionEnabled = false
        
        contentView.addSubview(textView)
    }
}
