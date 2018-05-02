//
//  SearchLeastCostPathUITests.swift
//  SearchLeastCostPathUITests
//
//  Created by Saumiya on 28/04/18.
//  Copyright © 2018 Saumiya. All rights reserved.
//

import XCTest

class SearchLeastCostPathUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    /**
     - Tests UI for valid cost matrix input and out displayed
     */
    func testFindLeastCostPathAction() {
        let expectedPathThrough = "Path through grid: YES"
        let expectedPathSequence = "Path sequence: [1 2 3 4 4 5]"
        let expectedPathCost = "Total cost: 16"
        
        let button = app.buttons["findleastCostButton"]
        button.tap()
        let pathThrough = app.staticTexts["pathThroughLabel"]
        let totalCost = app.staticTexts["totalCostLabel"]
        let pathSequence = app.staticTexts["pathSequenceLabel"]
        
        XCTAssertEqual(pathThrough.label, expectedPathThrough)
        XCTAssertEqual(totalCost.label, expectedPathCost)
        XCTAssertEqual(pathSequence.label, expectedPathSequence)
    }
    
    /**
     - Tests UI for valid cost matrix input and no path exists
     */

    
    func testFindLeastCostPathActionInputNoPathExist() {
        
        let expectedPathThrough = "Path through grid: NO"
        let expectedPathSequence = "Path sequence: []"
        let expectedPathCost = "Total cost: 0"
        
        let textviewTextView = app.textViews["textView"]
        textviewTextView.tap()
        textviewTextView.tap()
        app/*@START_MENU_TOKEN@*/.menuItems["Select All"]/*[[".menus.menuItems[\"Select All\"]",".menuItems[\"Select All\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let deleteKey = app/*@START_MENU_TOKEN@*/.keys["delete"]/*[[".keyboards.keys[\"delete\"]",".keys[\"delete\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        deleteKey.tap()
        textviewTextView.typeText("90,4,1,2,8,6\n60,1,8,2,7,4\n85,9,3,9,9,5")
        app/*@START_MENU_TOKEN@*/.buttons["findleastCostButton"]/*[[".buttons[\"Find Path\"]",".buttons[\"findleastCostButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let pathThrough = app.staticTexts["pathThroughLabel"]
        let totalCost = app.staticTexts["totalCostLabel"]
        let pathSequence = app.staticTexts["pathSequenceLabel"]
        
        XCTAssertEqual(pathThrough.label, expectedPathThrough)
        XCTAssertEqual(totalCost.label, expectedPathCost)
        XCTAssertEqual(pathSequence.label, expectedPathSequence)
    }
    
}

