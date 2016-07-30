//
//  ViewController.swift
//  CollegeMealPlanner
//
//  Created by Grant Fowler on 7/29/16.
//  Copyright © 2016 Grant Fowler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addMeal(meal: Meal){
        print("added meal into viewcontroller with \(meal.meals) \(meal.dining) \(meal.restaurant)")
    }

    @IBAction func addMealButton(sender: AnyObject) {
        performSegueWithIdentifier("addMealSegue", sender: self )
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let myController = segue.destinationViewController as? MealViewController {
            myController.last = self
        }
    }

}