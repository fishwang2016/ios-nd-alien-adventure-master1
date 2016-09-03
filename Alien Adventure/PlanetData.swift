//
//  PlanetData.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//
import Foundation

extension Hero {
    
    func planetData(dataFile: String) -> String {
        
        
        let dataURL = NSBundle.mainBundle().URLForResource(dataFile, withExtension: "json")!
        
        let rawData = NSData(contentsOfURL: dataURL)!
        
        var itemDictionFromData: [[String: AnyObject]]!
        
        
        do {
            itemDictionFromData = try! NSJSONSerialization.JSONObjectWithData(rawData, options: NSJSONReadingOptions()) as! [[String: AnyObject]]
        }
        
        
        //print(itemDictionFromData)
        var maxTotalPoints = 0
        var maxItem = ""
        
        for item in itemDictionFromData{
            
            if let common = item["CommonItemsDetected"] as? Int{
                
                if let uncommon = item["UncommonItemsDetected"] as? Int{
                    
                    if let rare =  item["RareItemsDetected"] as? Int{
                    
                        if let legend = item["LegendaryItemsDetected"] as? Int{
                            
                            let points = common * 1 + uncommon * 2 + rare * 3 + legend * 4
                            
                            if points > maxTotalPoints{
                            
                                 maxTotalPoints = points
                                
                                if let  itemName = item["Name"] as? String{
                                    
                                    maxItem = itemName

                                }
                            
                            } // if points
                        
                        
                        
                        }
                    
                    }
                }
            }
        }// for loop
        
        return maxItem
    }
}

// If you have completed this function and it is working correctly, feel free to skip this part of the adventure by opening the "Under the Hood" folder, and making the following change in Settings.swift: "static var RequestsToSkip = 7"