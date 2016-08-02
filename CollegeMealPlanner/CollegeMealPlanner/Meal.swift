//
//  Meal.swift
//  CollegeMealPlanner
//
//  Created by Grant Fowler on 7/29/16.
//  Copyright © 2016 Grant Fowler. All rights reserved.
//

import Foundation

struct Keys {
    static let name = "nameKey"
    static let meal = "mealKey"
    static let restaurant = "restaurantKey"
    static let dateComp = "dateComponentKey"
    static let date = "dateKey"
}

class Meal {
    var meals: Int
    var dining: Int?
    var restaurant: String?
    var dateComp = NSDateComponents()
    var date = NSDate()
    
    init(meals: Int, dining: Double?, restaurant: String?){
        self.meals = meals
        self.restaurant = restaurant
        if dining != nil{
            self.dining = Int(dining! * 100)
        }
        print("created new meal with values \(self.meals) \(self.dining) \(self.restaurant)")
        print("on " + date.description)
    }
}