//
//  ViewController.swift
//  CollegeMealPlanner
//
//  Created by Grant Fowler on 7/29/16.
//  Copyright © 2016 Grant Fowler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var DiningLabel: UILabel!
    @IBOutlet weak var MealLabel: UILabel!
    
    let defaults = UserDefaults.standard
    let defaultsKey = "MealList.Money"

    let mealList = MealList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addMeal(_ meal: Meal){
        mealList.addMeal(meal)
        print("added meal into viewcontroller with \(meal.meals) \(meal.dining) \(meal.restaurant)")
    }

    @IBAction func addMealButton(_ sender: AnyObject) {
        performSegue(withIdentifier: "addMealSegue", sender: self )
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let myController = segue.destination as? MealViewController {
            myController.last = self
        }
        if let myController = segue.destination as? MealHistoryViewController {
            print("going to history")
            myController.setMealList(mealList)
            myController.last = self
        }
        if let myController = segue.destination as? SettingsViewController {
            myController.last = self
        }
    }
    
    func updateLabels(){
        var keptValues = defaults.object(forKey: defaultsKey) as? [Int] ?? [0,0]
        let dining = keptValues[0]
        let swipes = keptValues[1]
        
        MealLabel.text = swipes.description
        DiningLabel.text = "$\(String(Double(dining)/100))"
    }

}
