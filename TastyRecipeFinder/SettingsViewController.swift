//
//  SettingsViewController.swift
//  TastyRecipeFinder
//
//  Created by Nana Asubonteng on 3/30/19.
//  Copyright © 2019 Nana Asubonteng. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    
    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var privacy: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    @IBAction func displySwitch(_ sender: UISwitch) {
        if (sender.isOn == true){
            display.text = "Night Mode On"
        }else{
            display.text = "Night Mode Off"
        }
    }
    
    
    @IBAction func privacySwitch(_ sender: UISwitch) {
    if (sender.isOn == true){
            privacy.text = "Private"
        }else{
            privacy.text = "Public"
        }
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
