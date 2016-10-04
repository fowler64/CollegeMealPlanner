//
//  MealList.swift
//  CollegeMealPlanner
//
//  Created by Grant Fowler on 8/3/16.
//  Copyright © 2016 Grant Fowler. All rights reserved.
//

import Foundation

class MealList{
    
    let defaults = UserDefaults.standard
    let defaultsKey = "MealList.Money"
    
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
        var keptValues = defaults.object(forKey: defaultsKey) as? [Int] ?? [0,0]
        dining = keptValues[0]
        swipes = keptValues[1]
        print("Dining: \(convertDining()) Meal: \(swipes)")
    }
    
    func saveMoney(){
        defaults.set([dining, swipes], forKey: defaultsKey)
    }
    
    
    func addMeal(_ toBeAdded: Meal){
        
        establishMoney()
        
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
    
    func removeMeal(_ toBeRemoved: Meal){
        
        establishMoney()
        
        if (toBeRemoved.dining != nil){
            dining += toBeRemoved.dining!
        }
        if (toBeRemoved.meals != 0){
            swipes += toBeRemoved.meals
        }
        saveMoney()
    }
    
    func getMeals() -> [Meal]{
        return meals
    }
    
    func setMeals(_ meals: [Meal]){
        self.meals = meals
        saveMeals()
    }
    
    func convertDining() -> Double{
        return Double(dining) / 100
    }
    
    // MARK: NSCoding
    func saveMeals() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(meals, toFile: Meal.ArchiveURL.path)
        if !isSuccessfulSave {
            print("Failed to save meals...")
        }
    }
    
    func loadMeals() -> [Meal]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Meal.ArchiveURL.path) as? [Meal]
    }
}
