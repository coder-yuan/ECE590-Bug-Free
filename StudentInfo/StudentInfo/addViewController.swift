//
//  addViewController.swift
//  StudentInfo
//
//  Created by 袁帅 on 9/21/15.
//  Copyright (c) 2015 yuanshuai. All rights reserved.
//

import UIKit

class addViewController: UIViewController, UITextFieldDelegate,  UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var photo: UIImageView!
    var s = " "
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var place: UITextField!
    
    @IBOutlet weak var degree: UITextField!
    
    @IBOutlet weak var Interest: UITextField!
    
    @IBOutlet weak var Programming: UITextField!
    
    @IBOutlet weak var work: UITextField!
    
    @IBAction func Save(sender: AnyObject) {
        var newStudent = StudentModel(name: textField.text, place: place.text, degree: degree.text, interests: Interest.text, exp: false, pLang: Programming.text, work:work.text)
        others.insert(newStudent, atIndex: 0)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.delegate = self
        
        
        // Do any additional setup after loading the view.
    }

    @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .PhotoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        
        presentViewController(imagePickerController, animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        // The info dictionary contains multiple representations of the image, and this uses the original.
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // Set photoImageView to display the selected image.
        photo.image = selectedImage
        
        // Dismiss the picker.
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        textField.resignFirstResponder()
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
