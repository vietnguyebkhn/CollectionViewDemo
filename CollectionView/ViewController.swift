//
//  ViewController.swift
//  CollectionView
//
//  Created by Nguyễn Việt on 8/15/18.
//  Copyright © 2018 Việt Nguyễn. All rights reserved.
//

import UIKit
import Font_Awesome_Swift

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
    @IBOutlet weak var mSearch: UITextField!
    @IBOutlet weak var mCollectionVew: UICollectionView!
    var arrData: [SampleVO] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardWhenTappedAround()
       mCollectionVew.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
    
//        let layout = mCollectionVew.collectionViewLayout as! UICollectionViewFlowLayout
//        layout.itemSize = CGSize(width: wight, height: height)
        
        loadDataLocal()
        // Do any additional setup after loading the view, typically from a nib.
//        mTitleLabel.setFAText(prefixText: " ", icon: FAType.init(rawValue: 00), postfixText: " ", size: 50, iconSize: 30)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var mSearchText: UITextField!
    func loadDataLocal() {
        if let path = Bundle.main.path(forResource: "data", ofType: "json")
        {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let listData = jsonResult["data"] as? [Any] {
                    for item in listData {
                        let i = SampleVO(data: item as! [String : AnyObject])
                        arrData.append(i)
                    }
                    
                    mCollectionVew.reloadData()
                }
            } catch {
                // handle error
            }
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrData.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.setdata(data: arrData[indexPath.row])
        return cell
        
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print(arrData)
//    }
}

