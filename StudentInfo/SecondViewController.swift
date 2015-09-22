//
//  SecondViewController.swift
//  StudentInfo
//
//  Created by 袁帅 on 9/21/15.
//  Copyright (c) 2015 yuanshuai. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    let df2 = DrawingforSecond(frame: CGRectMake(0, 0, 450, 800))
    
    @IBAction func doDismiss(sender: AnyObject) {
        self.presentingViewController!.dismissViewControllerAnimated(
            true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(df2)
        let blur = UIVisualEffectView(effect: UIBlurEffect(style: .Light))
        
        //blur.frame = dv.bounds
        blur.frame = CGRectMake(self.view.frame.width / 3 + 25, 150.0, 50.0, 50.0)
        let vib = UIVisualEffectView(effect: UIVibrancyEffect(
            forBlurEffect: blur.effect as! UIBlurEffect))
        vib.setTranslatesAutoresizingMaskIntoConstraints(false)
        vib.frame = df2.bounds
        //vib.center = CGPointMake(blur.bounds.midX, blur.bounds.midY)
        blur.contentView.addSubview(vib)
        df2.addSubview(blur)
        if self.df2.alpha == 1.0 {
            UIView.animateWithDuration(3.0, delay: 2.0, options: UIViewAnimationOptions.CurveEaseInOut | UIViewAnimationOptions.Autoreverse | UIViewAnimationOptions.Repeat, animations: {self.df2.alpha = 0.0}, completion: { if $0 { self.df2.removeFromSuperview() } })
        }


        // Do any additional setup after loading the view.
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
