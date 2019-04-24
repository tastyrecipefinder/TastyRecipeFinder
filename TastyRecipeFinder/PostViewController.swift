//
//  PostViewController.swift
//  TastyRecipeFinder
//
//  Created by Nana Asubonteng on 3/30/19.
//  Copyright © 2019 Nana Asubonteng. All rights reserved.
//

import UIKit
import AlamofireImage
import Parse

class PostViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var commentField: UITextField!
    
    @IBOutlet weak var captionField: UITextView!
    
    @IBOutlet weak var titleField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the vi ew.
    }
    

    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func post(_ sender: Any) {
        let postrecipe = PFObject(className: "Recipes")
        postrecipe["recipeSteps"] = captionField.text!
        postrecipe["mealname"] = titleField.text!
        postrecipe["user"] = PFUser.current()!
        
        let imageData = imageView.image!.pngData()
        let file = PFFileObject(data: imageData!)
        
        postrecipe["recipepost"] = file
        postrecipe.saveInBackground { (success, error) in
            if success {
                self.dismiss(animated: true, completion: nil)
                print("post saved")
            }else{
                print("did not save")
            }
        }
        
    }
    
    
    @IBAction func onCameraButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            picker.sourceType = .camera
        }else{
            picker.sourceType = .photoLibrary
        }
        present(picker, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        let size = CGSize(width: 300, height: 300)
        let scaledImage = image.af_imageScaled(to: size)
        
        imageView.image = scaledImage
        dismiss(animated: true, completion: nil)
    }

}
