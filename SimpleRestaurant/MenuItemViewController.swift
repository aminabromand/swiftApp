//
//  MenuItemViewController.swift
//  SimpleRestaurant
//
//  Created by Amin Abromand on 24.03.19.
//  Copyright © 2019 Amin Abromand. All rights reserved.
//

import UIKit

class MenuItemViewController: UIViewController {
    
    var itemTitle: String = ""
    var imageString: String = ""
    var itemDescription: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let label = UILabel()
        label.text = self.itemTitle
        label.textColor = .white
        label.textAlignment = .center
        label.sizeToFit()
        label.font = UIFont.systemFont(ofSize: 22.0)
        self.navigationItem.titleView = label
        
        self.view.backgroundColor = .white
        
        let navH = self.navigationController!.navigationBar.frame.height
        
        let image = UIImage(named: self.imageString)
        let imgV = UIImageView(image: image!)
        imgV.frame = CGRect(x: 0, y: 45 + navH, width: self.view.frame.width, height: 250)
        imgV.contentMode = .scaleAspectFill
        imgV.clipsToBounds = true
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 210 + navH, width: self.view.frame.width, height: 50))
        titleLabel.text = self.itemTitle
        
        let itemTitleLabel = UILabel(frame: CGRect(x: 0, y: 300 + navH, width: self.view.frame.width, height: 50))
        itemTitleLabel.text = self.itemTitle
        itemTitleLabel.textAlignment = .center
        itemTitleLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        
        let descriptionLabel = UILabel(frame: CGRect(x: 0, y: 350 + navH, width: self.view.frame.width, height: 50))
        descriptionLabel.text = self.itemDescription
        descriptionLabel.textAlignment = .center
        
        self.view.addSubview(imgV)
        self.view.addSubview(titleLabel)
        self.view.addSubview(itemTitleLabel)
        self.view.addSubview(descriptionLabel)
        
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
