//
//  Meal.swift
//  CollegeMealPlanner
//
//  Created by Grant Fowler on 7/29/16.
//  Copyright © 2016 Grant Fowler. All rights reserved.
//

import Foundation

class Meal {
    var meals: Int
    var dining: Double?
    var restaurant: String?
    
    init(meals: Int, dining: Double?, restaurant: String?){
        self.meals = meals
        self.dining = dining
        self.restaurant = restaurant
        print("created new meal with values \(self.meals) \(self.dining) \(self.restaurant)")
    }
}