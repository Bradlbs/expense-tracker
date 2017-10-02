//
//  ExpenseTrackerUITests.swift
//  ExpenseTrackerUITests
//
//  Created by 吃面包的布拉德 on 2017/8/27.
//  Copyright © 2017年 吃面包的布拉德. All rights reserved.
//

import XCTest

class ExpenseTrackerUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        
        let app = XCUIApplication()
        let tabBarsQuery = app.tabBars
        let activityButton = tabBarsQuery.buttons["Activity"]
        activityButton.tap()
        tabBarsQuery.buttons["Charts"].tap()
        tabBarsQuery.buttons["Setting"].tap()
        activityButton.tap()
        app.buttons["Cancel"].tap()
        activityButton.tap()
        app.buttons["icons8 medical doctor filled"].tap()
        app.buttons["9"].tap()
        
        let button = app.buttons["5"]
        button.tap()
        app.buttons["+"].tap()
        button.tap()
        app.buttons["="].tap()
        app.buttons["Done"].tap()
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}
