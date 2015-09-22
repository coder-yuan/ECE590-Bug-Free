//
//  SecondViewController.swift
//  StudentInfo
//
//  Created by 袁帅 on 9/21/15.
//  Copyright (c) 2015 yuanshuai. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var rateButtons = [UIButton]()
    var rating = 0
    
    @IBAction func doDismiss(sender: AnyObject) {
        if rating == 0{
            var alert = UIAlertController(title: "Alert", message: "This profile has no rating", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Rate them!", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        } else {
        self.presentingViewController!.dismissViewControllerAnimated(
            true, completion: nil)}
    }
    var imageView = UIImageView(image: UIImage(named: "computer games"))
    
    
    let dv = DrawingforSecond(frame: CGRectMake(0, 0, 450, 800))
    let dv2 = DrawingforSecond2(frame: CGRectMake(100, 400, 200, 200))
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(imageView)
        addShadow()
        addRating()
        self.view.addSubview(dv2)
        self.view.addSubview(dv)
        imageView.frame = CGRectMake(50.0, 100.0, 400, 200.0)
        let blur = UIVisualEffectView(effect: UIBlurEffect(style: .Light))
        
        //blur.frame = dv.bounds
        blur.frame = CGRectMake(self.view.frame.width / 3 - 40, 150.0, 50.0, 50.0)
        let vib = UIVisualEffectView(effect: UIVibrancyEffect(
            forBlurEffect: blur.effect as! UIBlurEffect))
        vib.setTranslatesAutoresizingMaskIntoConstraints(false)
        vib.frame = dv.bounds
        blur.contentView.addSubview(vib)
        dv.addSubview(blur)
        
        // Do any additional setup after loading the view.
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
    func addShadow() {
        imageView.layer.shadowOffset = CGSize(width: 15, height: 15)
        imageView.layer.shadowOpacity = 0.6
        imageView.layer.shadowRadius = 4
        
    }
    override func viewDidAppear(animated: Bool) {
        if self.dv.alpha == 1.0 {
            UIView.animateWithDuration(3.0, delay: 2.0, options: UIViewAnimationOptions.CurveEaseInOut | UIViewAnimationOptions.Autoreverse | UIViewAnimationOptions.Repeat, animations: {self.dv.alpha = 0.0}, completion: { if $0 { self.dv.removeFromSuperview() } })
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
