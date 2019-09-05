//
//  UberAppUITests.swift
//  UberAppUITests
//
//  Created by MR.Robot 💀 on 05/09/2019.
//  Copyright © 2019 Joselson Dias. All rights reserved.
//

import XCTest

class UberAppUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    //What the below function does:
    
//    Calling XCUIApplication() gets you access to the test harness for your running application. This lets you query its user interface and perform actions as if you were a user.
//    Calling .tables will return an XCUIElementQuery, which in our situation would point to our table.
    
    func testInitialStateIsCorrect() {
        let table = XCUIApplication().tables
        XCTAssertEqual(table.cells.count, 7, "There should be 7 rows initially")
    }
    
    
    
    //What is happening below:
    
//    When the app is recording a UI test, any taps, swipes, or other actions performed in the app will automatically be converted to code inside test – Xcode will write the test for me. However, there are three catches: first, it will usually write some fairly unpleasant code, and certainly rarely writes what a trained developer would do; second, it still doesn't know what a pass or fail looks like, so I need to add my own assertions at the end; third, sometimes it won't even write valid code, although recent Xcode versions have reduced the chance of that happening.
    
    func testUserFilteringByString() {

        
        let app = XCUIApplication()
        app.navigationBars["Quotes"].buttons["Search"].tap()
        app.alerts["Filter…"].buttons["Filter"].tap()
    }
}


//The benefit of this: the most impressively thing is that I can run all my tests on Xcode Server, which is the beginning of continuous integration: every time a code is commited to source control, Xcode Server can pull down those changes, build the app, and run the full suite of tests. 
