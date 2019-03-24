//
//  MenuViewController.swift
//  SimpleRestaurant
//
//  Created by Amin Abromand on 23.03.19.
//  Copyright © 2019 Amin Abromand. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    var collection: UICollectionView?
//    var menuItems = [String]()
    var menuArrayDict = [[String:Any]]()
    let barTintColor = UIColor.black
    let tintColor = UIColor.gray

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // set navigation controller color + tab bar controller color
        self.navigationController?.navigationBar.barTintColor = barTintColor
        self.navigationController?.navigationBar.tintColor = tintColor
        
        self.tabBarController?.tabBar.barTintColor = barTintColor
        self.tabBarController?.tabBar.tintColor = tintColor
        
        let label = UILabel()
        label.text = "Simple Restaurant"
        label.textColor = .white
        label.textAlignment = .center
        label.sizeToFit()
        label.font = UIFont.systemFont(ofSize: 22.0)
        self.navigationItem.titleView = label
        
//        self.menuItems = LocationInfo().getMenuImages()
        self.menuArrayDict = LocationInfo().getMenuDict()
        
//        let imageString = menuItems[0]
//        let image = UIImage(named: imageString)
//        let imageView = UIImageView(image: image)
//
//        imageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 250)
//        imageView.contentMode = UIView.ContentMode.scaleAspectFill
//        imageView.clipsToBounds = true
//        self.view.addSubview(imageView)
        
        let layout = UICollectionViewFlowLayout()
        //layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        //layout.itemSize = CGSize(width: self.view.frame.width/3.0 - 10, height: self.view.frame.width/3.0 - 10)
        
        let navH = self.navigationController!.navigationBar.frame.height
        let tabH = self.tabBarController!.tabBar.frame.height
        
        
        self.collection = UICollectionView(frame: CGRect(x: 0, y: navH, width: self.view.frame.width, height: self.view.frame.height - navH - tabH), collectionViewLayout: layout)
        
        self.collection!.delegate = self
        self.collection!.dataSource = self
        self.collection!.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        self.view.addSubview(self.collection!)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        

//        cell.backgroundColor = UIColor.red
//
//        let newCellView = UIView(frame: cell.frame)
//        newCellView.backgroundColor = .gray
//
//
//        let imgV = UIImageView(frame: cell.frame)
//        imgV.image = UIImage(named: menuArrayDict[indexPath.row]["imageStringName"] as! String)
//        imgV.contentMode = UIView.ContentMode.scaleAspectFill
//        imgV.clipsToBounds = true
// //
// //        cell.backgroundView = imgV
        
        cell.imageView.image = UIImage(named: menuArrayDict[indexPath.row]["imageStringName"] as! String)
        
        
//
//        let label = UILabel(frame: cell.frame)
//        label.text = menuArrayDict[indexPath.row]["title"] as? String
        
        cell.textView.text = menuArrayDict[indexPath.row]["title"] as? String
        
//
//        newCellView.addSubview(imgV)
//        newCellView.addSubview(label)
//
//        cell.backgroundView = newCellView
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuArrayDict.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        //return 2.5
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2.5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: self.view.frame.width/3.0 - 5)
        //return CGSize(width: self.view.frame.width/3.0 - 5, height: self.view.frame.width/3.0 - 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("indexPath.row: \(indexPath.row)")
        let vc = MenuItemViewController()
//        vc.title = menuArrayDict[indexPath.row]["title"] as? String
        vc.itemTitle = menuArrayDict[indexPath.row]["title"] as! String
        vc.imageString = menuArrayDict[indexPath.row]["imageStringName"]! as! String
        vc.itemDescription = menuArrayDict[indexPath.row]["description"]! as! String
        
        self.navigationController?.show(vc, sender: self)
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
