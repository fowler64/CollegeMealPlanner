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
    
    @IBOutlet weak var mealCounter: UISegmentedControl!

    @IBOutlet weak var diningText: UITextField!
    
    @IBOutlet weak var restaurantText: UITextField!
    
    var last: ViewController?

    
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
            navigationController?.popViewControllerAnimated(true)
        }
        
    }
    
}
