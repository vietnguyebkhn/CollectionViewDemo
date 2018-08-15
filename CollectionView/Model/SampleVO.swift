//
//  SampleVO.swift
//  CollectionView
//
//  Created by Nguyễn Việt on 8/15/18.
//  Copyright © 2018 Việt Nguyễn. All rights reserved.
//

import Foundation

class SampleVO {
    var icon = ""
    var title = ""
    var color = ""
    
    
    init(data: [String: AnyObject]) {
        

        icon = data["icon"] as? String ?? ""
        title = data["title"] as? String ?? ""
        color = data["color"] as? String ?? ""
    }
}
