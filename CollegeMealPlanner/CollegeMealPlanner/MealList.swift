//
//  MealList.swift
//  CollegeMealPlanner
//
//  Created by Grant Fowler on 8/3/16.
//  Copyright © 2016 Grant Fowler. All rights reserved.
//

import Foundation

class MealList{
    var dining = 50000
    var swipes = 20
    var meals = [Meal]()
    init(){
        print("new meal list created")
        populateMeals()
    }
    
    func populateMeals(){
        establishMoney()
    }
    
    func establishMoney(){

    }
    
    func saveMeals(){
        
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
                
                print("dining changed to \(changeDining())")
            }
        }
        
        if add{
            populateMeals()
            meals.append(toBeAdded)
            saveMeals()
        }
    }
    
    func removeMeal(toBeRemoved: Meal){
        if (toBeRemoved.dining != nil){
            dining += toBeRemoved.dining!
        }
        if (toBeRemoved.meals != 0){
            swipes += toBeRemoved.meals
        }
    }
    
    func getMeals() -> [Meal]{
        return meals
    }
    
    func setMeals(meals: [Meal]){
        self.meals = meals
    }
    
    func changeDining() -> Double{
        return Double(dining) / 100
    }
}