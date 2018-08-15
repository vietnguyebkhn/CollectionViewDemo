//
//  CollectionViewCell.swift
//  CollectionView
//
//  Created by Nguyễn Việt on 8/15/18.
//  Copyright © 2018 Việt Nguyễn. All rights reserved.
//

import UIKit
import  Font_Awesome_Swift

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var mTitlesLb: UILabel!
    @IBOutlet weak var mIconLb: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setdata(data: SampleVO) {
        mTitlesLb.text = data.title
        let icon = Int(data.icon) ?? 0
        mIconLb.FAIcon = FAType.init(rawValue: icon)
        let color = String(data.color) ?? ""
        mIconLb.textColor = UIColor(hexString: color)
        
    }

}
