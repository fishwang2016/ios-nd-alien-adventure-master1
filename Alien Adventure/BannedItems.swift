//
//  BannedItems.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

import Foundation

extension Hero {
    
    func bannedItems(dataFile: String) -> [Int] {
        
        var banID = [Int]()
        
        let dataFileURL = NSBundle.mainBundle().URLForResource(dataFile, withExtension: "plist")!
        
        let itemDicFromList = NSArray(contentsOfURL:dataFileURL) as! [[String: AnyObject]]
        
       // print(itemDicFromList)
        
        for item in itemDicFromList {
            
            if let name = item["Name"] as? String  where  name.lowercaseString.containsString("laser") {
                
                if let  historyData = item["HistoricalData"] as? NSDictionary{
                    
                    if let age = historyData["CarbonAge"] as? Int where age < 30 {
                        
                            if let id = item["ItemID"] as? Int {
                                
                                banID.append(id)
                            }
                    
                    }// if age

                
                }// if historyData
                
                    
                
            
            } // if name
            
    
        } // for loop
        
       // print(banID)
        
        return banID
    
    }
}

// If you have completed this function and it is working correctly, feel free to skip this part of the adventure by opening the "Under the Hood" folder, and making the following change in Settings.swift: "static var RequestsToSkip = 6"