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
        if restaurant != nil{
            self.restaurant = " \(restaurant!)"
        }
        if dining != nil{
            self.dining = Int(dining! * 100)
        }
        print("created new meal with values \(self.meals) \(self.dining) \(self.restaurant)")
        print("on " + date.description)
    }
    
    func getDateString() -> String{
        var dateString = String()
        var x = 1
        
        if (NSDateComponents().day - dateComp.day) < 7{
            x = 0
            dateString.appendContentsOf(" ")
        }
        
        //add the weekday
        var dateArray = date.descriptionWithLocale(date).componentsSeparatedByCharactersInSet(NSCharacterSet(charactersInString: ","))
        dateString.appendContentsOf(dateArray[x])
        //add the time
        var timeArray = dateArray[2].componentsSeparatedByString(":")
        dateString.appendContentsOf(timeArray[0].substringWithRange(Range<String.Index>(timeArray[0].startIndex.advancedBy(5) ..< timeArray[0].endIndex.advancedBy(0))))
        dateString.appendContentsOf(":")
        dateString.appendContentsOf(timeArray[1])
        //add am or pm
        if dateArray[2].containsString("PM"){
            dateString.appendContentsOf(" PM")
        }else {
            dateString.appendContentsOf(" AM")
        }

        
        return dateString
    }
    
    func getPayString() -> String{
        var payString = String()
        
        if meals != 0{
            payString.appendContentsOf("Meals: \(meals) ")
        }
        if meals != 0 && dining != nil{
            payString.appendContentsOf("\n")
        }
        if dining != nil{
            payString.appendContentsOf("Dining: $\(Double(dining!) / 100)")
        }
        
        return payString
    }
}