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
    var last: ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the sample data.
        //meals = mealList.getMeals()
        
        navigationItem.rightBarButtonItem = editButtonItem
    }
    
    func setMealList(_ mealList: MealList){
        self.mealList = mealList
        //setUpTestMeals()
        meals = self.mealList.getMeals().reversed()
        print("mealList set")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "MealTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MealTableViewCell
        
        // Fetches the appropriate meal for the data source layout.
        // Set up restaurant label
        let meal = meals[(indexPath as NSIndexPath).row]
        
        if meal.restaurant != nil{
            cell.RestaurantLabel.isEnabled = true
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
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     
    
    
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
        mealList.removeMeal(meals.remove(at: (indexPath as NSIndexPath).row))
        mealList.setMeals(meals)
        last?.updateLabels()
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
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
