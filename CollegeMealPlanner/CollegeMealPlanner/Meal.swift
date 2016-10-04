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

extension String {
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }
    
    func substring(from: Int) -> String {
        let fromIndex = index(from: from)
        return substring(from: fromIndex)
    }
    
    func substring(to: Int) -> String {
        let toIndex = index(from: to)
        return substring(to: toIndex)
    }
    
    func substring(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return substring(with: startIndex..<endIndex)
    }
    
    func substring(start s: Int, end e: Int) -> String {
        let startIndex = index(from: s)
        let endIndex = index(from: e)
        return substring(with: startIndex..<endIndex)
    }
}



class Meal: NSObject, NSCoding {
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(meals, forKey: Keys.meals)
        if (dining != nil){
            aCoder.encode(dining!, forKey: Keys.dining)
        }else{
            aCoder.encode(0, forKey: Keys.dining)
        }
        aCoder.encode(restaurant, forKey: Keys.restaurant)
        aCoder.encode(dateComp, forKey: Keys.dateComp)
        aCoder.encode(date, forKey: Keys.date)
    }

    var meals: Int = 0
    var dining: Int?
    var restaurant: String?
    var dateComp = NSDateComponents()
    var date = NSDate()
    
    // for saving and restore
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("meals")
    
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encode(meals, forKey: Keys.meals)
        if (dining != nil){
            aCoder.encode(dining!, forKey: Keys.dining)
        }else{
            aCoder.encode(0, forKey: Keys.dining)
        }
        aCoder.encode(restaurant, forKey: Keys.restaurant)
        aCoder.encode(dateComp, forKey: Keys.dateComp)
        aCoder.encode(date, forKey: Keys.date)
    }
    
    // if there is data to reload itll reload it
    required convenience init?(coder aDecoder: NSCoder) {
        let restaurant = aDecoder.decodeObject(forKey: Keys.restaurant) as? String
        let meals = aDecoder.decodeInteger(forKey: Keys.meals)
        let dining = aDecoder.decodeInteger(forKey: Keys.dining)
        if dining == 0{
            self.init(meals: meals, dining: nil, restaurant: restaurant)
        }else{
            self.init(meals: meals, dining: Double(dining)/100, restaurant: restaurant)
        }
        
        // after init set dates to what they should be
        dateComp = (aDecoder.decodeObject(forKey: Keys.dateComp) as? NSDateComponents)!
        date = aDecoder.decodeObject(forKey: Keys.date) as! NSDate
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
            dateString.append(" ")
        }
        
//        add the weekday
        var dateArray = date.description(with: date).components(separatedBy: NSCharacterSet(charactersIn: ",") as CharacterSet)
        dateString.append(dateArray[x])
        //add the time
        
        var timeArray = dateArray[2].components(separatedBy: ":")
        dateString.append(timeArray[0].substring(from: 5))
//        dateString.appendContentsOf(timeArray[0].substringWithRange(Range<String.Index>(timeArray[0].startIndex.advancedBy(5) ..< timeArray[0].endIndex.advancedBy(0))))
        dateString.append(":")
        dateString.append(timeArray[1])
        //add am or pm
        
        if (dateArray[2]).contains("PM"){
            dateString.append(" PM")
        }else {
            dateString.append(" AM")
        }

        
        return dateString
    }
    
    func getPayString() -> String{
        var payString = String()
        
        if meals != 0{
            payString.append("Meals: \(meals) ")
        }
        if meals != 0 && dining != nil{
            payString.append("\n")
        }
        if dining != nil{
            payString.append("Dining: $\(Double(dining!) / 100)")
        }
        
        return payString
    }
}
