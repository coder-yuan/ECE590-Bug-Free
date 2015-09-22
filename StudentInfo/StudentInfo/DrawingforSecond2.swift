//
//  DrawingforSecond2.swift
//  StudentInfo
//
//  Created by Tian Chan Dong on 9/21/15.
//  Copyright (c) 2015 yuanshuai. All rights reserved.
//

import UIKit

class DrawingforSecond2: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    override init(frame:CGRect) {
        super.init(frame:frame)
        self.backgroundColor = UIColor.clearColor()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func drawRect(rect: CGRect) {
        // Drawing code
        var context:CGContextRef =  UIGraphicsGetCurrentContext()
        CGContextSetAllowsAntialiasing(context, true)
        CGContextSetLineWidth(context, 20)
        CGContextSetStrokeColorWithColor(context, UIColor.redColor().CGColor) //set color
        CGContextAddArc(context, 100, 100, 50, 0, CGFloat(270*M_PI/180), 0) //
        CGContextStrokePath(context)//
    }
}
