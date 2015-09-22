//
//  DrawingforSecond.swift
//  StudentInfo
//
//  Created by 袁帅 on 9/21/15.
//  Copyright (c) 2015 yuanshuai. All rights reserved.
//

import UIKit

class DrawingforSecond: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    var image = UIImage(named: "Tracy")
    override init(frame:CGRect) {
        super.init(frame:frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func drawRect(rect: CGRect) {
        // Drawing code
        
        if var im = self.image {
            im.drawAtPoint(CGPointZero)
        }
        
        /*var context:CGContextRef =  UIGraphicsGetCurrentContext()
        CGContextSetAllowsAntialiasing(context, true)
        CGContextSetLineWidth(context, 20)
        CGContextSetStrokeColorWithColor(context, UIColor.redColor().CGColor) //设置画笔颜色
        CGContextAddArc(context, 100, 100, 50, 0, CGFloat(270*M_PI/180), 0) //
        CGContextStrokePath(context)//close*/
    }

}
