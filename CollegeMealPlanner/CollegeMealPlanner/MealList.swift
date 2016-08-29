//
//  MealList.swift
//  CollegeMealPlanner
//
//  Created by Grant Fowler on 8/3/16.
//  Copyright © 2016 Grant Fowler. All rights reserved.
//

import Foundation

class MealList{
    var meals = [Meal]()
    init(){
        populateMeals()
    }
    
    func populateMeals(){
        
    }
    
    func saveMeals(){
        
    }
    
    func addMeal(toBeAdded: Meal){
        populateMeals()
        meals.append(toBeAdded)
        saveMeals()
    }
    
    func getMeals() -> [Meal]{
        return meals
    }
    
    func setMeals(meals: [Meal]){
        self.meals = meals
    }
}