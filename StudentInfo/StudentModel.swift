//
//  StudentModel.swift
//  StudentInfo
//
//  Created by 袁帅 on 9/17/15.
//  Copyright (c) 2015 yuanshuai. All rights reserved.
//

import UIKit

class StudentModel: NSObject {
    var name: String = ""
    var placeOfOrigin : String = ""
    var degree : String = ""
    var hobbie : String = ""
    var workExp : Bool = false
    var workPlace : String?
    var programmingLang : String = ""
    var check: Bool = false
    var path : String = ""
    
    init(name : String, place : String, degree : String, interests : String, exp : Bool, pLang : String, work : String?){
        self.name = name
        self.degree = degree
        self.hobbie = interests
        self.placeOfOrigin = place
        self.programmingLang = pLang
        self.workExp = exp
        self.check = false
        self.path = name
        self.workPlace = work
    }
}
