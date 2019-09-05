//
//  PlayData.swift
//  UberApp
//
//  Created by MR.Robot 💀 on 05/09/2019.
//  Copyright © 2019 Joselson Dias. All rights reserved.
//

import Foundation

class PlayData {
    var allWords = [String]() //It is holding an array of strings
    var wordCounts: NSCountedSet!
    private(set) var filteredWords = [String]() //Only this class can write to filtered words
    
    
    //Initializes line with data
    init() {
        if let path = Bundle.main.path(forResource: "plays", ofType: "txt") {
            if let plays = try? String(contentsOfFile: path) {
                allWords = plays.components(separatedBy: CharacterSet.alphanumerics.inverted)
                
                // Checks if allWords is empty (It is a closure)
                allWords = allWords.filter { $0 != "" }
                
                wordCounts = NSCountedSet(array: allWords)
                let sorted = wordCounts.allObjects.sorted { wordCounts.count(for: $0) > wordCounts.count(for: $1) } //this will sort the array
                allWords = sorted as! [String]
                
            }
        }
        
        applyUserFilter("swift")
    }
    
    
    func applyUserFilter(_ input: String) {
        
        //Checks if it is a number or string
        if let userNumber = Int(input) {
            // we got a number!
             applyFilter { self.wordCounts.count(for: $0) >= userNumber }
        }
        
        else {
            // we got a string!
            applyFilter { $0.range(of: input, options: .caseInsensitive) != nil }
        }
    }
    
    
    
    //!!!----This is a closure-----!!!
    
    //  First, the parameter is called filter, which means that's how we can refer to it inside applyFilter(). Then we have (String), which means this parameter is a function that accepts a single string parameter. Finally, we have -> Bool, which means the function should return a boolean.

    //For Example
//    It's possible to have as many of these as I want, so we could have written a method that accepts three filters if we wanted to:
//
//    func applyFilter(_ filter1: (String) -> Bool, filter2: (Int) -> String, filter3: (Double)) { }
    
    //for the above example: In that code, filter2 must be a function that accepts an integer parameter and returns a string, and filter3 must be a function that accepts a double and returns nothing.
    
    func applyFilter(_ filter: (String) -> Bool) {
        filteredWords = allWords.filter(filter)
    }
    
    
    
}


