//
//  FourthViewController.swift
//  StudentInfo
//
//  Created by 袁帅 on 9/21/15.
//  Copyright (c) 2015 yuanshuai. All rights reserved.
//

import UIKit
import AVFoundation

class FourthViewController: UIViewController {
    // let df2 = DrawingforSecond(frame: CGRectMake(0, 0, 450, 800))
    var audioPlayer = AVAudioPlayer()
    var lastPoint = CGPoint.zeroPoint
    var brushWidth: CGFloat = 5.0
    var swiped = false
    var backgroundView = UIImageView()
    var musicButton = UIButton()
    var rateButtons = [UIButton]()
    var rating = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        modalTransitionStyle = .FlipHorizontal
        
        backgroundView.frame = UIScreen.mainScreen().bounds
        self.view.addSubview(backgroundView)
        
        addRating()

        musicButtonPlay()
        
        drawImage()
        
        flipBack()
        
        drawPiano()
        
    }
    
    func addRating(){
        var x = CGFloat(50)
        var image = UIImage(named: "emptyStar")
        for i in 0...4{
            var tempButton = UIButton()
            tempButton.frame = CGRectMake(x, 300, 40, 40)
            //tempButton.backgroundColor = UIColor(patternImage:image!)
            tempButton.setImage(image, forState: UIControlState.Normal)
            tempButton.addTarget(self, action: "rate:", forControlEvents: UIControlEvents.TouchUpInside)
            tempButton.tag = i
            rateButtons.append(tempButton)
            self.view.addSubview(tempButton)
            x+=50
        }
    }
    
    func rate(sender : UIButton){
        var emptyStar = UIImage(named: "emptyStar")
        var filledStar = UIImage(named: "filledStar")
        rating = sender.tag
        for i in 0...4 {
            if i <= sender.tag {
                rateButtons[i].setImage(filledStar, forState: UIControlState.Normal)
            } else {
                rateButtons[i].setImage(emptyStar, forState : UIControlState.Normal)
            }
            
        }
    }
    
    func musicButtonPlay(){
        musicButton.frame = CGRectMake(100, 100, 100, 50)
        
        musicButton.addTarget(self, action: "playMusic:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(musicButton)
    }
    
    func drawImage(){
        let image = UIImage(named: "Background.JPG")
        let originalImage = CIImage(image: image)
        var filter = CIFilter(name: "CIPhotoEffectMono")
        filter.setDefaults()
        filter.setValue(originalImage, forKey: kCIInputImageKey)
        
        var outputImage = filter.outputImage
        var newImage = UIImage(CIImage: outputImage)
        var subView = UIImageView(image:newImage!)
        subView.alpha = 0.5
        
        self.view.addSubview(subView)
    }
    
    func playMusic(sender : UIButton){
        let path = NSBundle.mainBundle().pathForResource("Für Elise", ofType:"wav")
        let fileURL = NSURL(fileURLWithPath: path!)
        audioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error: nil)
        audioPlayer.prepareToPlay()
        audioPlayer.play()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func drawPiano(){
        let imageSize = CGSize(width: 280, height: 100)
        let imageView = UIImageView(frame: CGRect(origin: CGPoint(x: 20, y: 70), size: imageSize))
        //self.view.addSubview(imageView)
        let image = drawCustomImage(imageSize)
        musicButton.backgroundColor = UIColor(patternImage:image)
        musicButton.layer.shadowColor = UIColor.blackColor().CGColor
        musicButton.layer.shadowOffset = CGSizeMake(5, 5)
        musicButton.layer.shadowRadius = 5
        musicButton.layer.shadowOpacity = 1.0
    }
    
    func drawCustomImage(size: CGSize) -> UIImage {
        // Setup
        let bounds = CGRect(origin: CGPoint.zeroPoint, size: size)
        let opaque = false
        let scale: CGFloat = 0
        UIGraphicsBeginImageContextWithOptions(size, opaque, scale)
        let context = UIGraphicsGetCurrentContext()
        
        // Setup complete, do drawing here
        CGContextSetStrokeColorWithColor(context, UIColor.blackColor().CGColor)
        CGContextSetLineWidth(context, 1.0)
        
        CGContextStrokeRect(context, bounds)
        
        //Draw white keys
        let width = CGRectGetWidth(bounds)
        let height = CGRectGetHeight(bounds)
        let minX = CGRectGetMinX(bounds)
        
        CGContextBeginPath(context)
        var position = 0.0
        let widthInc = Double(width)/10.0
        var xPos = 0.0
        for offset in 1...9 {
            position = widthInc * Double(offset)
            xPos = Double(minX) + position
            CGContextMoveToPoint(context, CGFloat(xPos), CGRectGetMinY(bounds))
            CGContextAddLineToPoint(context, CGFloat(xPos), CGRectGetMaxY(bounds))
        }
        CGContextStrokePath(context)
        
        //Draw black keys
        //define keys
        let keyWidth = widthInc*2.0/3.0
        let keyHeight = Double(height)*0.6
        
        //set fill
        UIColor.blackColor().setFill()
        var rectangle = CGRectMake(0,0,0,0)
        
        let keyPosition = [0,1,3,4,5,7,8]
        var blackxPos = 0.0
        
        //Draw keys
        for pos in keyPosition{
            blackxPos = Double(pos) * widthInc + keyWidth
            rectangle = CGRectMake(CGFloat(blackxPos),0,CGFloat(keyWidth),CGFloat(keyHeight))
            CGContextFillRect(context, rectangle)
            CGContextAddRect(context, rectangle)
        }
        CGContextStrokePath(context)
        
        
        // Drawing complete, retrieve the finished image and cleanup
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        swiped = false
        if let touch = touches.first as? UITouch {
            lastPoint = touch.locationInView(self.view)
        }
    }
    
    func drawLineFrom(fromPoint: CGPoint, toPoint: CGPoint) {
        
        
        UIGraphicsBeginImageContext(view.frame.size)
        let context = UIGraphicsGetCurrentContext()
        backgroundView.image?.drawInRect(CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        
        
        CGContextMoveToPoint(context, fromPoint.x, fromPoint.y)
        CGContextAddLineToPoint(context, toPoint.x, toPoint.y)
        
        
        CGContextSetLineCap(context, kCGLineCapRound)
        CGContextSetLineWidth(context, brushWidth)
        CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 1.0)
        CGContextSetBlendMode(context, kCGBlendModeNormal)
        
        CGContextStrokePath(context)
        
        backgroundView.image = UIGraphicsGetImageFromCurrentImageContext()
        backgroundView.alpha = 1.0
        UIGraphicsEndImageContext()
        
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        swiped = true
        if let touch = touches.first as? UITouch {
            let currentPoint = touch.locationInView(view)
            drawLineFrom(lastPoint, toPoint: currentPoint)
            
            lastPoint = currentPoint
        }
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        if !swiped {
            // draw a single point
            drawLineFrom(lastPoint, toPoint: lastPoint)
        }
    }
    
    func flipBack(){
        var backButton = UIButton()
        backButton.frame = CGRectMake(10, 10, 100, 50)
        backButton.setTitle("flip back", forState: UIControlState.Normal)
        backButton.addTarget(self, action: "doDismiss:", forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(backButton)
        
    }
    
    func doDismiss(sender : AnyObject){
        if rating == 0{
            var alert = UIAlertController(title: "Alert", message: "This profile has no rating", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Rate them!", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        } else {
            self.presentingViewController!.dismissViewControllerAnimated(true, completion: nil)}
    }
}
/*
// MARK: - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
// Get the new view controller using segue.destinationViewController.
// Pass the selected object to the new view controller.
}
*/


