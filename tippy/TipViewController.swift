//
//  ViewController.swift
//  tippy
//
//  Created by John Abreu on 6/20/17.
//  Copyright © 2017 John Abreu. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Tippy"
        let defaults = UserDefaults.standard
        if(defaults.object(forKey: "default_tip_percentage") == nil) {
            defaults.set(20, forKey: "default_tip_percentage")
        }
        
        billField.becomeFirstResponder()

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        billField.becomeFirstResponder()
        
        let defaults = UserDefaults.standard
        let tip = defaults.double(forKey: "default_tip_percentage")
        
        tipLabel.setTitle(String(format:"%.0f%%", tip), for: .normal)
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }

    @IBAction func calculateTip(_ sender: Any) {
        
        let bill = Double(billField.text!) ?? 0
        
        let defaults = UserDefaults.standard
        let tip = bill * defaults.double(forKey: "default_tip_percentage")
        
        let total = bill + (tip/100)
        
        
        totalLabel.text = String(format: "$%.2f", total)
    }
}

