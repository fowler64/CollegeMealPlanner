//
//  MealList.swift
//  CollegeMealPlanner
//
//  Created by Grant Fowler on 8/3/16.
//  Copyright © 2016 Grant Fowler. All rights reserved.
//

import Foundation

class MealList{
    var dining: Int = 0
    var swipes = 0
    var meals = [Meal]()
    init(){
        populateMeals()
    }
    
    func populateMeals(){
        establishMoney()
    }
    
    func establishMoney(){
        dining = 500
        swipes = 20
    }
    
    func saveMeals(){
        
    }
    
    func addMeal(toBeAdded: Meal){
        
        // change overall meal and dining number
        // and only add meal if it can be bought
        if (toBeAdded.dining != nil){
            if ((dining - toBeAdded.dining!) >= 0){
                dining -= toBeAdded.dining!
                
                populateMeals()
                meals.append(toBeAdded)
            }
        }
        if (toBeAdded.meals != 0 && (swipes - toBeAdded.meals) >= 0){
            swipes -= toBeAdded.meals
            
            populateMeals()
            meals.append(toBeAdded)
        }
        
        saveMeals()
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
}