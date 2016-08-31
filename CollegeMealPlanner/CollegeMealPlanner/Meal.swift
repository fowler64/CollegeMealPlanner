//
//  Meal.swift
//  CollegeMealPlanner
//
//  Created by Grant Fowler on 7/29/16.
//  Copyright © 2016 Grant Fowler. All rights reserved.
//

import Foundation

struct Keys {
    static let meals = "mealKey"
    static let dining = "diningKey"
    static let restaurant = "restaurantKey"
    static let dateComp = "dateComponentKey"
    static let date = "dateKey"
}


class Meal: NSObject, NSCoding {
    var meals: Int = 0
    var dining: Int?
    var restaurant: String?
    var dateComp = NSDateComponents()
    var date = NSDate()
    
    // for saving and restore
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("meals")
    
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeInteger(meals, forKey: Keys.meals)
        if (dining != nil){
            aCoder.encodeInteger(dining!, forKey: Keys.dining)
        }else{
            aCoder.encodeInteger(0, forKey: Keys.dining)
        }
        aCoder.encodeObject(restaurant, forKey: Keys.restaurant)
        aCoder.encodeObject(dateComp, forKey: Keys.dateComp)
        aCoder.encodeObject(date, forKey: Keys.date)
    }
    
    // if there is data to reload itll reload it
    required convenience init?(coder aDecoder: NSCoder) {
        let restaurant = aDecoder.decodeObjectForKey(Keys.restaurant) as? String
        let meals = aDecoder.decodeIntegerForKey(Keys.meals)
        let dining = aDecoder.decodeIntegerForKey(Keys.dining)
        if dining == 0{
            self.init(meals: meals, dining: nil, restaurant: restaurant)
        }else{
            self.init(meals: meals, dining: Double(dining)/100, restaurant: restaurant)
        }
        
        // after init set dates to what they should be
        dateComp = aDecoder.decodeObjectForKey(Keys.dateComp) as! NSDateComponents
        date = aDecoder.decodeObjectForKey(Keys.date) as! NSDate
    }
    
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
        
        super.init()
    }
    
    func setValues(meals: Int, dining: Double?, restaurant: String?){
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