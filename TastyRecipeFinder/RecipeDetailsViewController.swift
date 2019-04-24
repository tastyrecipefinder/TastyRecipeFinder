//
//  RecipeDetailsViewController.swift
//  TastyRecipeFinder
//
//  Created by Nana Asubonteng on 4/22/19.
//  Copyright © 2019 Nana Asubonteng. All rights reserved.
//

import UIKit
import Parse
import AlamofireImage
class RecipeDetailsViewController: UIViewController {
     var recipe:PFObject!

    @IBOutlet weak var dishImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var recipeInstructions: UILabel!
    
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLabel.text = recipe["mealname"] as? String
        recipeInstructions.text = recipe["recipeSteps"] as? String
        let imageFile = recipe["recipepost"] as! PFFileObject
        let urlString = imageFile.url!
        let url = URL(string: urlString)!
        
        dishImage.af_setImage(withURL: url)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
