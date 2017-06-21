//
//  SettingsViewController.swift
//  tippy
//
//  Created by John Abreu on 6/20/17.
//  Copyright © 2017 John Abreu. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var defaultField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaultField.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = UserDefaults.standard
        let tip = defaults.double(forKey: "default_tip_percentage")
        
        defaultField.placeholder = String(format:"%.0f%%", tip)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        let defaultTip = Double(defaultField.text!) ?? 0
        
        let defaults = UserDefaults.standard
        defaults.set(defaultTip, forKey: "default_tip_percentage")
        defaults.synchronize()
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
