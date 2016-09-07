//
//  MealViewController.swift
//  CollegeMealPlanner
//
//  Created by Grant Fowler on 7/29/16.
//  Copyright © 2016 Grant Fowler. All rights reserved.
//

import UIKit

class MealViewController: UIViewController {
    //MARK: Outlets
    var tax = 0.08875
    
    @IBOutlet weak var mealCounter: UISegmentedControl!

    @IBOutlet weak var diningText: UITextField!
    
    @IBOutlet weak var restaurantText: UITextField!
    
    var last: ViewController?

    @IBAction func addTax(sender: AnyObject) {
        if diningText.hasText(){
            var text = Double(diningText.text!)!
            text = text * (1 + tax)
            let temp = Int(text*100)
            text = Double(temp) / 100
            diningText.text = "\(text)"
        }
    }
    
    @IBAction func subTax(sender: AnyObject) {
        if diningText.hasText(){
            var text = Double(diningText.text!)!
            text = text / (1 + tax)
            let temp = Int(text*100+1)
            text = Double(temp) / 100
            diningText.text = "\(text)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: Actions
    @IBAction func finishMeal(sender: AnyObject) {
        
        let meals = mealCounter.selectedSegmentIndex
        var dinings: Double?
        var restaurantName: String?
        
        if diningText.hasText(){
            dinings = Double(diningText.text!)
            print("wrote \(dinings)")
        }
        
        if restaurantText.hasText(){
            restaurantName = restaurantText.text
        }
        
        if meals != 0 || dinings != nil{
            let meal = Meal(meals: meals, dining: dinings, restaurant: restaurantName)
            last?.addMeal(meal)
            last?.updateLabels()
            
            navigationController?.popViewControllerAnimated(true)
        }
        
        
    }
    
}
