//
//  MostCommonCharacter.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func mostCommonCharacter(inventory: [UDItem]) -> Character? {
        
        var cDict = [Character: Int]()
        
        var mostC = Character?()
        
        
        for item in inventory{
            
            for c in item.name.lowercaseString.characters{
                
                    if cDict[c] == nil {  // if no keys as c
                        
                        cDict[c] = 0
                    }
                        cDict[c]! += 1
              }
        
        }// for loop
        print(cDict)
        
        for (k,v ) in cDict{
        
            if v == cDict.values.maxElement(){
            
               mostC = k
            }
        
        }
        return mostC
    }
}
