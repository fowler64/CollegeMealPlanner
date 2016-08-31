//
//  MealList.swift
//  CollegeMealPlanner
//
//  Created by Grant Fowler on 8/3/16.
//  Copyright © 2016 Grant Fowler. All rights reserved.
//

import Foundation

class MealList{
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    var defaultsKey = "MealList.Money"
    
    var dining = 50000
    var swipes = 20
    var meals = [Meal]()
    init(){
        print("new meal list created")
        populateMeals()
        establishMoney()
    }
    
    func populateMeals(){
        if let savedMeals = loadMeals() {
            meals += savedMeals
        }
    }
    
    func establishMoney(){
        var keptValues = defaults.objectForKey(defaultsKey) as? [Int] ?? [0,0]
        dining = keptValues[0]
        swipes = keptValues[1]
        print("Dining: \(convertDining()) Meal: \(swipes)")
    }
    
    func saveMoney(){
        defaults.setObject([dining, swipes], forKey: defaultsKey)
    }
    
    
    func addMeal(toBeAdded: Meal){
        
        // change overall meal and dining number
        // and only add meal if it can be bought
        var add = false
        
        if (toBeAdded.meals != 0 && (swipes - toBeAdded.meals) >= 0){
            add = true
            swipes -= toBeAdded.meals
            
            print("meals changed to \(swipes)")
        }
        
        if (toBeAdded.dining != nil){
            if ((dining - toBeAdded.dining!) >= 0){
                add = true
                dining -= toBeAdded.dining!
                
                print("dining changed to \(convertDining())")
            }
        }
        
        if add{
            meals.append(toBeAdded)
            saveMeals()
            saveMoney()
        }
    }
    
    func removeMeal(toBeRemoved: Meal){
        if (toBeRemoved.dining != nil){
            dining += toBeRemoved.dining!
            saveMoney()
        }
        if (toBeRemoved.meals != 0){
            swipes += toBeRemoved.meals
            saveMoney()
        }
    }
    
    func getMeals() -> [Meal]{
        return meals
    }
    
    func setMeals(meals: [Meal]){
        self.meals = meals
        saveMeals()
    }
    
    func convertDining() -> Double{
        return Double(dining) / 100
    }
    
    // MARK: NSCoding
    func saveMeals() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(meals, toFile: Meal.ArchiveURL.path!)
        if !isSuccessfulSave {
            print("Failed to save meals...")
        }
    }
    
    func loadMeals() -> [Meal]? {
        return NSKeyedUnarchiver.unarchiveObjectWithFile(Meal.ArchiveURL.path!) as? [Meal]
    }
}