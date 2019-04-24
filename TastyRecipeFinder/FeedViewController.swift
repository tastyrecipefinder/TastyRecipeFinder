//
//  FeedViewController.swift
//  TastyRecipeFinder
//
//  Created by Nana Asubonteng on 3/30/19.
//  Copyright © 2019 Nana Asubonteng. All rights reserved.
//

import UIKit
import Parse
import AlamofireImage

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var posts = [PFObject]()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let query = PFQuery(className: "Recipes")
        query.includeKey("user")
        query.limit = 20
        query.findObjectsInBackground { (posts, error) in
            if posts != nil{
                self.posts = posts!
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostViewCell") as! PostViewCell
        let post = posts[indexPath.row]
        let user = post["user"] as! PFUser
        
        cell.usernameLabel.text = user.username
        cell.titleLabel.text = post["mealname"] as? String
        cell.captionLabel.text = post["recipeSteps"] as? String
        let imageFile = post["recipepost"] as! PFFileObject
        let urlString = imageFile.url!
        let url = URL(string: urlString)!
        
        cell.photoView.af_setImage(withURL: url)
        return cell
    }

    @IBAction func Logout(_ sender: Any) {
        PFUser.logOut()
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginView = main.instantiateViewController(withIdentifier: "LoginView")
        let delegate = UIApplication.shared.delegate as! AppDelegate
        delegate.window?.rootViewController = loginView
        
    }
    @IBAction func addPost(_ sender: Any) {
        self.performSegue(withIdentifier: "newPost", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetails" {
            let cell = sender as! PostViewCell
            if let indexPath = tableView.indexPath(for: cell) {
                let recipe = posts[indexPath.row]
                let detailsViewController = segue.destination as! RecipeDetailsViewController
                detailsViewController.recipe = recipe
                tableView.deselectRow(at: indexPath, animated: true)
            }
        }
    }
}
