//
//  DetailViewController.swift
//  StudentInfo
//
//  Created by 袁帅 on 9/17/15.
//  Copyright (c) 2015 yuanshuai. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var imageView : UIImageView!
    @IBOutlet weak var originText : UITextField!
    @IBOutlet weak var educationText : UITextField!
    @IBOutlet weak var hobbieText : UITextField!
    @IBOutlet weak var languageText : UITextField!
    @IBOutlet weak var workText : UITextField!

    var student : StudentModel?

    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            //imageView = UIImageView(image: UIImage(named: student?.name ?? ""))
            //imageView = UIImageView(image: UIImage(named: "Shuai Yuan"))
            //textView.text = student?.info

            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail: AnyObject = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = student?.name
        
        var image = UIImage(named: (student?.name ?? ""))//+".JPG"))
        imageView.image = image;
        originText.text = student?.placeOfOrigin
        originText.userInteractionEnabled = false
        originText.textAlignment = NSTextAlignment.Center
        educationText.text =  student?.degree
        educationText.userInteractionEnabled = false
        educationText.textAlignment = NSTextAlignment.Center
        hobbieText.text = student?.hobbie
        hobbieText.userInteractionEnabled = false
        hobbieText.textAlignment = NSTextAlignment.Center
        languageText.text = student?.programmingLang
        languageText.userInteractionEnabled = false
        languageText.textAlignment = NSTextAlignment.Center
        //if student!.workExp{
        if student != nil{
            workText.text = student?.workPlace
        } else{
            workText.text = "None"
        }
        workText.userInteractionEnabled = false
        workText.textAlignment = NSTextAlignment.Center
        


    
        self.configureView()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        


    
// integration with photo library
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
    /*
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        // The info dictionary contains multiple representations of the image, and this uses the original.
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // Set photoImageView to display the selected image.
        imageView.image = selectedImage
        //student!.image = selectedImage.description
        // Dismiss the picker.
        dismissViewControllerAnimated(true, completion: nil)
    }*/

}

