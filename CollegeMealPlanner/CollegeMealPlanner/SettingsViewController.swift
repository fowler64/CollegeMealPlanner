//
//  SettingsViewController.swift
//  CollegeMealPlanner
//
//  Created by Grant Fowler on 8/31/16.
//  Copyright © 2016 Grant Fowler. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    

    @IBOutlet weak var MealField: UITextField!
    @IBOutlet weak var DiningField: UITextField!
    
    var last: ViewController?
    
    let defaults = NSUserDefaults.standardUserDefaults()
    let defaultsKey = "MealList.Money"

    func setUp(){
    }
    
    @IBAction func SaveButtonPressed(sender: AnyObject) {

        var keptValues = defaults.objectForKey(defaultsKey) as? [Int] ?? [0,0]
        var dining = keptValues[0]
        var meal = keptValues[1]
        
        if DiningField.hasText(){
            dining = Int(Double(DiningField.text!)!*100)
        }
        if MealField.hasText(){
            meal = Int(MealField.text!)!
        }
        
        
        defaults.setObject([dining, meal], forKey: defaultsKey)
        print("saved dining: \(dining) meals: \(meal)")
        last?.updateLabels()
        
        navigationController?.popViewControllerAnimated(true)
    }

}
