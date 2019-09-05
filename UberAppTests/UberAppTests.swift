//
//  UberAppTests.swift
//  UberAppTests
//
//  Created by MR.Robot 💀 on 05/09/2019.
//  Copyright © 2019 Joselson Dias. All rights reserved.
//

import XCTest
@testable import UberApp

class UberAppTests: XCTestCase {
    
//    There are other functions such as: XCTAssertGreaterThan(), XCTAssertNotNil(), however, almost everything can be achieved with XCTAssertEqual

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testWordCountsAreCorrect(){
        
        let playData = PlayData()
        
        //The function below checks that 'playData.allWords.count' is equal to second param '0'
        XCTAssertEqual(playData.allWords.count, 18440, "allWordsmust was not 18440")
        
        XCTAssertEqual(playData.wordCounts.count(for: "heart"), 389, "Heart does not appear 174 times")
        XCTAssertEqual(playData.wordCounts.count(for: "out"), 524, "Out does not appear 4 times")
        XCTAssertEqual(playData.wordCounts.count(for: "mortal"), 41, "Mortal does not appear 41 times")
    }
    
    
    //This function measures how long it takes to execute a block of code
    
    func testWordsLoadQuickly() {
        measure {
            _ = PlayData()
        }
    }
    
    func testUserFilterWorks() {
        let playData = PlayData()
        
        playData.applyUserFilter("100")
        XCTAssertEqual(playData.filteredWords.count, 495, "Appears 495 times")
        
        playData.applyUserFilter("1000")
        XCTAssertEqual(playData.filteredWords.count, 55, "Appears 55 times")
        
        playData.applyUserFilter("10000")
        XCTAssertEqual(playData.filteredWords.count, 1, "Appears 10000 times")
        
        playData.applyUserFilter("test")
        XCTAssertEqual(playData.filteredWords.count, 56, "test ppears 56 times")
        
        playData.applyUserFilter("swift")
        XCTAssertEqual(playData.filteredWords.count, 7, "Swift Appears 7 times")
        
        playData.applyUserFilter("objective-c")
        XCTAssertEqual(playData.filteredWords.count, 0, "Appears 0 times")
    }


}
