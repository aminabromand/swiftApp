//
//  LocationsViewController.swift
//  SimpleRestaurant
//
//  Created by Amin Abromand on 23.03.19.
//  Copyright © 2019 Amin Abromand. All rights reserved.
//

import UIKit

class LocationsViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    var collection: UICollectionView?
    var locationArrayDict = [[String:Any]]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.locationArrayDict = LocationInfo().getDefaultAddresses()
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        self.collection = UICollectionView(frame: CGRect(x: 0, y: self.view.frame.height/3.0, width: self.view.frame.width, height: self.view.frame.height * 2/3.0), collectionViewLayout: layout)
        
        self.collection!.delegate = self
        self.collection!.dataSource = self
        self.collection!.register(LocationCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        self.view.addSubview(self.collection!)
        
        
        let navH = self.navigationController!.navigationBar.frame.height * 2
        print(navH)
        
        let label = UILabel(frame: CGRect(x: 0, y: navH, width: self.view.frame.width, height: 50))
        label.text = "Druebbelken"
        label.textAlignment = .center
        
        self.view.addSubview(label)
        
        let hoursLabel = UILabel(frame: CGRect(x: 0, y: 50 + navH, width: self.view.frame.width, height: 50))
        hoursLabel.text = LocationInfo().getGeneralHours()
        hoursLabel.textAlignment = .center
        
        self.view.addSubview(hoursLabel)
        
        let phoneLabel = UILabel(frame: CGRect(x: 0, y: 100 + navH, width: self.view.frame.width, height: 50))
        phoneLabel.text = LocationInfo().getPhone()
        phoneLabel.textAlignment = .center
        
        self.view.addSubview(phoneLabel)
        
        let websiteLabel = UILabel(frame: CGRect(x: 0, y: 150 + navH, width: self.view.frame.width, height: 50))
        websiteLabel.text = "\(LocationInfo().getWebsiteURL())"
        websiteLabel.textAlignment = .center
        
        self.view.addSubview(websiteLabel)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.locationArrayDict.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! LocationCollectionViewCell
        
        cell.titleTextView.text     = self.locationArrayDict[indexPath.row]["title"] as? String
        cell.addressTextView.text   = self.locationArrayDict[indexPath.row]["address"] as? String
        cell.hoursTextView.text     = self.locationArrayDict[indexPath.row]["hours"] as? String
        cell.phoneTextView.text     = self.locationArrayDict[indexPath.row]["phone"] as? String
        cell.websiteTextView.text   = self.locationArrayDict[indexPath.row]["website"] as? String
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("indexPath.row: \(indexPath.row)")
        let vc = LocationItemViewController()
        vc.title                = locationArrayDict[indexPath.row]["title"] as? String
        vc.locationTitleText    = locationArrayDict[indexPath.row]["title"]! as! String
        vc.addressText          = locationArrayDict[indexPath.row]["address"]! as! String
        vc.hoursText            = locationArrayDict[indexPath.row]["hours"]! as! String
        vc.phoneText            = locationArrayDict[indexPath.row]["phone"]! as! String
        vc.websiteText          = locationArrayDict[indexPath.row]["website"]! as! String
        
        self.navigationController?.show(vc, sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        //return 2.5
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2.5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 250)
    }
    
}
