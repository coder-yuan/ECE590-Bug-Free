//
//  StudentModel.swift
//  StudentInfo
//
//  Created by 袁帅 on 9/17/15.
//  Copyright (c) 2015 yuanshuai. All rights reserved.
//

import UIKit

class StudentModel: NSObject {
    var id : String
    var image: String
    var name: String
    var info: String
    var check: Bool = false
    
    init(id: String, image: String, name: String, info: String) {
        self.id = id
        self.image = image
        self.name = name
        self.info = info
    }

}
