//
//  MealHistoryViewController.swift
//  CollegeMealPlanner
//
//  Created by Grant Fowler on 8/5/16.
//  Copyright © 2016 Grant Fowler. All rights reserved.
//

import UIKit

class MealHistoryViewController: UITableViewController {
    // MARK: Properties
    var mealList = MealList()
    var meals: [Meal] = [Meal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the sample data.
        //meals = mealList.getMeals()
        
        navigationItem.rightBarButtonItem = editButtonItem()
    }
    
    func setUpTestMeals(){
        // Creates test meals
        let meal1 = Meal(meals: 1, dining: nil, restaurant: "test Mewal")
        let meal2 = Meal(meals: 0, dining: 14.9864, restaurant: "test Dining")
        let meal3 = Meal(meals: 1, dining: 4.54, restaurant: nil)
        meals += [meal1, meal2, meal3]
    }
    
    func setMealList(mealList: MealList){
        self.mealList = mealList
        //setUpTestMeals()
        meals = self.mealList.getMeals()
        print("mealList set")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "MealTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! MealTableViewCell
        
        // Fetches the appropriate meal for the data source layout.
        // Set up restaurant label
        let meal = meals[indexPath.row]
        
        if meal.restaurant != nil{
            cell.RestaurantLabel.enabled = true
            cell.RestaurantLabel.text = meal.restaurant
        }
        
        // Set up date and pay label
        cell.DateLabel.text = meal.getDateString()
        cell.PaymentLabel.numberOfLines = 0;
        //cell.PaymentLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        cell.PaymentLabel.text = meal.getPayString()
        cell.PaymentLabel.sizeToFit()
        cell.PaymentLabel.updateConstraints()
        
        return cell
    }
    
    
     // Override to support conditional editing of the table view.
     override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     
    
    
     // Override to support editing the table view.
     override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
     if editingStyle == .Delete {
     // Delete the row from the data source
        mealList.removeMeal(meals.removeAtIndex(indexPath.row))
        mealList.setMeals(meals)
     tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
     } else if editingStyle == .Insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
    
    
    /*
     // Override to support rearranging the table view.
     override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
