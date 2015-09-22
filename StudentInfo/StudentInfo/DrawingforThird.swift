//
//  DrawingforThird.swift
//  StudentInfo
//
//  Created by 袁帅 on 9/21/15.
//  Copyright (c) 2015 yuanshuai. All rights reserved.
//

import UIKit

class DrawingforThird: UIView {

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
    
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        
        //UIGraphicsBeginImageContextWithOptions(CGSizeMake(100, 100), false, 0)
        if rect.size.height == 100 {
            self.backgroundColor = UIColor.yellowColor()
        }
            
        else{
            let con:CGContextRef = UIGraphicsGetCurrentContext()
            
            CGContextSetLineWidth(con, 1.5)
            CGContextSetStrokeColorWithColor(con, UIColor.yellowColor().CGColor)
            
            //CGContextAddLineToPoint(con, 0, 600)
            
            
            var count:CGFloat = 1500
            for _ in 0..<6{
                CGContextMoveToPoint(con, 300, 50)
                CGContextAddLineToPoint(con, 0, count)
                count = count/2
                CGContextStrokePath(con)
            }
            
            CGContextAddEllipseInRect(con, CGRectMake(250, 0, 100, 100))
            CGContextSetFillColorWithColor(con, UIColor.orangeColor().CGColor)
            CGContextFillPath(con)
            
            
        }
        
    }

}
