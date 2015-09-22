//
//  ThirdViewController.swift
//  StudentInfo
//
//  Created by 袁帅 on 9/21/15.
//  Copyright (c) 2015 yuanshuai. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
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
    let sdView = UIImageView(image: UIImage(named: "sdview"))
    let vl = UIImageView(image: UIImage(named: "violin-color"))
    
    let tr = UIImage(named: "music-tree")
    
    let n1 = DrawingforThird(frame: CGRectMake(0, 50, 350, 500))
    
    let n2 = DrawingforThird(frame: CGRectMake(0, 490, 350, 100))
    
    let word1 = UILabel(frame:CGRectMake(100, 520, 350, 40))
    
    let word2 = UILabel(frame:CGRectMake(90, 520, 350, 40))
    
    
    
    //@IBOutlet weak var sdView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.addSubview(n1)
        
        var visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .Light)) as UIVisualEffectView
        
        visualEffectView.frame = n2.bounds
        addRating()
        n2.addSubview(visualEffectView)
        
        self.view.addSubview(n2)
        
        // set background
        
        self.view.backgroundColor = UIColor(patternImage: tr!)
        
        // set violin
        
        vl.frame = CGRect(x: 120, y: 320, width: 220, height: 220)
        //vl.frame = CGRect(x: 20, y: 0, width: 300, height: 550)
        vl.contentMode = UIViewContentMode.ScaleAspectFill
        
        self.view.addSubview(vl)
        
        // set sdView
        
        //sdView.alpha = 0.0
        
        self.view.addSubview(sdView)
        
        //viewDidAppear(true)
        
        // set Label
        word1.text = "Facing the sea"
        word1.textColor = UIColor.yellowColor()
        word1.layer.shadowOffset = CGSizeZero
        word1.layer.shadowOpacity = 0.5
        word1.layer.shadowRadius = 5
        
        self.view.addSubview(word1)
        
        word2.text = "Enjoying the music"
        word2.textColor = UIColor.blackColor()
        word2.layer.shadowOffset = CGSizeZero
        word2.layer.shadowOpacity = 0.7
        word2.layer.shadowRadius = 7
        
        
        word2.alpha = 0.0
        self.view.addSubview(word2)
    }
    
    override func viewDidAppear(animated: Bool) {
        //super.viewDidAppear(animated)
        /*
        UIImageView.animateWithDuration(5.0, animations: {
        
        })
        */
        UIView.animateWithDuration(2.7, delay: 1.0, options: .CurveEaseOut, animations: {
            
            self.word1.alpha = 0.0
            
            self.sdView.alpha = 1.0
            
            self.sdView.alpha = 0.0
            
            self.word2.alpha = 1.0
            
            }, completion: { finished in
                println("sdView out")
            })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
