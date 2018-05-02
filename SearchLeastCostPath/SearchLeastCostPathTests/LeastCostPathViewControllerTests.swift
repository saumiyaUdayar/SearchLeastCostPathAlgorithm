//
//  LeastCostPathViewControllerTests.swift
//  SearchLeastCostPathTests
//
//  Created by Saumiya on 29/04/18.
//  Copyright © 2018 Saumiya. All rights reserved.
//

import XCTest
@testable import SearchLeastCostPath

class LeastCostPathViewControllerTests: XCTestCase {
    
    var leastCostPathViewController: LeastCostPathViewController?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        leastCostPathViewController = UIStoryboard(name: "Main", bundle: .main).instantiateInitialViewController() as? LeastCostPathViewController
        _ = leastCostPathViewController?.view
    }
    
    /**
     - Test ViewController initialization
     */
    func testViewControllerInitialized() {
        XCTAssertNotNil(leastCostPathViewController?.view)
        XCTAssertNotNil(leastCostPathViewController?.findPathButton)
        XCTAssertNotNil(leastCostPathViewController?.resetButton)
    }
    
    /**
     - Test Find Path Action for default input matrix in textView
     */
    func testFindPathActions() {
        leastCostPathViewController?.findPathButton.sendActions(for: .touchUpInside)
        XCTAssertEqual(leastCostPathViewController?.isPathThrough.text, "Path through grid: YES")
        XCTAssertEqual(leastCostPathViewController?.totalCost.text, "Total cost: 16")
        XCTAssertEqual(leastCostPathViewController?.pathSequence.text, "Path sequence: [1 2 3 4 4 5]")
    }
    
    /**
     - Test Reset Action for UI components
     */
    func testResetAction() {
        leastCostPathViewController?.resetButton.sendActions(for: .touchUpInside)
        XCTAssertEqual(leastCostPathViewController?.inputTextView.text, "")
        XCTAssertEqual(leastCostPathViewController?.isPathThrough.text, "")
        XCTAssertEqual(leastCostPathViewController?.pathSequence.text, "")
        XCTAssertEqual(leastCostPathViewController?.totalCost.text, "")
    }
}
