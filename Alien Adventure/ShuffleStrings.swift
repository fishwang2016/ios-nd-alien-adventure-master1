//
//  ShuffleStrings.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 9/30/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func shuffleStrings(s1 s1: String, s2: String, shuffle: String) -> Bool {
        
        if (s1 == "" && s2 == "" && shuffle == "" ) {
            return true
            
            
        }else if (shuffle.characters.count > (s1.characters.count + s2.characters.count))  {
            
            return false
            
        } else {
            
            var s1Temp = ""
            var s2Temp = ""
            var w = ""
            
            let shuffleArray = Array(shuffle.characters)
            
            for i in Array(shuffleArray) {
                
                w = String(i)
                
                
                if s1.containsString(w){
                    
                    s1Temp += w
                    // string can only plus string , can not plus character
                    
                } else if s2.containsString(w){
                    
                    s2Temp += w
                }
                
            }// for w in shuffle loop
            
            
            if s1Temp == s1 && s2Temp == s2 {
                
                return true
                
            } else {
                
                return false
                
            }
            
        }
    }
}
