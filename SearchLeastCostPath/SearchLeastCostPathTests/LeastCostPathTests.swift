//
//  LeastCostPathTests.swift
//  SearchLeastCostPathTests
//
//  Created by Udaiyar, Saumiya on 4/28/18.
//  Copyright © 2018 Saumiya. All rights reserved.
//

import XCTest
@testable import SearchLeastCostPath

class LeastCostPathTests: XCTestCase {
    
    /**
     - Test for empty cost matrix
     */
    func testValidateEmptyCostString() {
        XCTAssertThrowsError(try LeastCostPath(costMatrix: [])) { error in
            XCTAssertEqual(error as? InputError, InputError.emptyInput)
        }
    }
    
    /**
     - Test for given cost matrix validate the row and column count
     */
    
    func testMaxRowColumnCount() {
        let matrix = [[4,2,7,-2],
                      [7,2,3,-5]]
        
        let expectedRowCount = 2
        let expectedColumnCount = 4
        let leastCostMatrixProcessor = try! LeastCostPath(costMatrix: matrix)
        
        XCTAssertEqual(expectedRowCount, leastCostMatrixProcessor.maxRows)
        XCTAssertEqual(expectedColumnCount, leastCostMatrixProcessor.maxColumns)
    }
    
    
    /**
     - Example 1
     - Test for 5X6 cost matrix
     - Path is through the grid and cost below max limit 50
     */
    func testExample1() {
        let matrix = [[3,4,1,2,8,6],
                      [6,1,8,2,7,4],
                      [5,9,3,9,9,5],
                      [8,4,1,3,2,6],
                      [3,7,2,8,6,4]]
        let expectedIsPathThrough = "YES"
        let expectedTotalCost = 16
        let expectedPathSequence = [1,2,3,4,4,5]
        let leastCostMatrixProcessor = try! LeastCostPath(costMatrix: matrix)
        let path = leastCostMatrixProcessor.fetchLeastCostPath()
        
        XCTAssertTrue(expectedIsPathThrough == path?.isPathThroughGrid)
        XCTAssertTrue(expectedTotalCost == path?.totalCost)
        XCTAssertTrue(expectedPathSequence == (path?.rowPathSequence)!)
    }
    
    /**
     - Example 2
     - Test for 5X6 cost matrix
     - Multiple paths are through the grid with same cost below max limit 50
     */
    func testExample2() {
        let matrix = [[3,4,1,2,8,6],
                      [6,1,8,2,7,4],
                      [5,9,3,9,9,5],
                      [8,4,1,3,2,6],
                      [3,7,2,1,2,3]]
        let expectedIsPathThrough = "YES"
        let expectedTotalCost = 11
        let expectedPathSequence = [1,2,1,5,4,5]
        let leastCostMatrixProcessor = try! LeastCostPath(costMatrix: matrix)
        let path = leastCostMatrixProcessor.fetchLeastCostPath()
        
        XCTAssertTrue(expectedIsPathThrough == path?.isPathThroughGrid)
        XCTAssertTrue(expectedTotalCost == path?.totalCost)
        XCTAssertTrue(expectedPathSequence == (path?.rowPathSequence)!)
    }
    
    /**
     - Example 3
     - Test for 3X5 cost matrix
     - Path is not through the grid as cost exceeds above max limit 50
     */
    func testExample3() {
        let matrix = [[19,10,19,10,19],
                      [21,23,20,19,12],
                      [20,12,20,11,10]]
        let expectedIsPathThrough = "NO"
        let expectedTotalCost = 48
        let expectedPathSequence = [1,1,1]
        let leastCostMatrixProcessor = try! LeastCostPath(costMatrix: matrix)
        let path = leastCostMatrixProcessor.fetchLeastCostPath()
        
        XCTAssertTrue(expectedIsPathThrough == path?.isPathThroughGrid)
        XCTAssertTrue(expectedTotalCost == path?.totalCost)
        XCTAssertTrue(expectedPathSequence == (path?.rowPathSequence)!)
    }
    
    /**
     - Example 4
     - Test for 1X5 cost matrix
     - Path is through the grid and cost below max limit 50
     */
    func testExample4() {
        let matrix = [[5,8,5,3,5]]
        let expectedIsPathThrough = "YES"
        let expectedTotalCost = 26
        let expectedPathSequence = [1,1,1,1,1]
        let leastCostMatrixProcessor = try! LeastCostPath(costMatrix: matrix)
        let path = leastCostMatrixProcessor.fetchLeastCostPath()
        
        XCTAssertTrue(expectedIsPathThrough == path?.isPathThroughGrid)
        XCTAssertTrue(expectedTotalCost == path?.totalCost)
        XCTAssertTrue(expectedPathSequence == (path?.rowPathSequence)!)
    }
    
    /**
     - Example 5
     - Test for 3X5 cost matrix
     - Path is not through the grid as cost is above max limit
     - Path initiates with cost above max limit
     */
    func testExample5() {
        let matrix = [[69,10,19,10,19],
                      [51,23,20,19,12],
                      [60,12,20,11,10]]
        let expectedIsPathThrough = "NO"
        let expectedTotalCost = 0
        let expectedPathSequence = [Int]()
        let leastCostMatrixProcessor = try! LeastCostPath(costMatrix: matrix)
        let path = leastCostMatrixProcessor.fetchLeastCostPath()
        
        XCTAssertTrue(expectedIsPathThrough == path?.isPathThroughGrid)
        XCTAssertTrue(expectedTotalCost == path?.totalCost)
        XCTAssertTrue(expectedPathSequence == (path?.rowPathSequence)!)
    }
    
    /**
     - Example 6
     - Test for 3X20 cost matrix negative cost
     - Path is not through the grid as cost is above max limit
     - Path initiates with cost above max limit
     */
    func testExample6() {
        let matrix = [[2,0,1,7,3,2,0,1,7,3,2,1,2,-2,1,0,2,0,1,7],
                      [1,3,0,-9,-1,2,0,1,7,3,3,2,0,1,7,3,2,0,1,-2],
                      [1,2,-2,1,0,2,0,1,7,3,2,2,0,1,7,3,2,0,1,-5]]
        let expectedIsPathThrough = "YES"
        let expectedTotalCost = 2
        let expectedPathSequence = [3,1,3,2,2,1,2,3,1,2,3,1,3,1,1,1,3,1,2,3]
        let leastCostMatrixProcessor = try! LeastCostPath(costMatrix: matrix)
        let path = leastCostMatrixProcessor.fetchLeastCostPath()
        
        XCTAssertTrue(expectedIsPathThrough == path?.isPathThroughGrid)
        XCTAssertTrue(expectedTotalCost == path?.totalCost)
        XCTAssertTrue(expectedPathSequence == (path?.rowPathSequence)!)
    }
    
    /**
     - Example 7
     - Test for 1X1 cost matrix
     - Path is not through the grid as cost is above max limit
     - Path initiates with cost above max limit
     */
    func testExample7() {
        let matrix = [[2]]
        let expectedIsPathThrough = "YES"
        let expectedTotalCost = 2
        let expectedPathSequence = [1]
        let leastCostMatrixProcessor = try! LeastCostPath(costMatrix: matrix)
        let path = leastCostMatrixProcessor.fetchLeastCostPath()
        
        XCTAssertTrue(expectedIsPathThrough == path?.isPathThroughGrid)
        XCTAssertTrue(expectedTotalCost == path?.totalCost)
        XCTAssertTrue(expectedPathSequence == (path?.rowPathSequence)!)
    }
    
    /**
     - Example 8
     - Test for 1X3 cost matrix
     - Path is not through the grid as cost is above max limit
     - Path initiates with cost above max limit
     */
    func testExample8() {
        let matrix = [[-15,8,65]]
        let expectedIsPathThrough = "NO"
        let expectedTotalCost = -7
        let expectedPathSequence = [1,1]
        let leastCostMatrixProcessor = try! LeastCostPath(costMatrix: matrix)
        let path = leastCostMatrixProcessor.fetchLeastCostPath()
        
        XCTAssertTrue(expectedIsPathThrough == path?.isPathThroughGrid)
        XCTAssertTrue(expectedTotalCost == path?.totalCost)
        XCTAssertTrue(expectedPathSequence == (path?.rowPathSequence)!)
    }
    
    /**
     - Example 9
     - Test for 3X5 cost matrix
     - Path is not through the grid as cost is above max limit
     - Path initiates with cost above max limit
     */
    func testExample9() {
        let matrix = [[69,10,19,10,19],
                      [5,3,-2,9,12],
                      [6,12,2,1,10]]
        let expectedIsPathThrough = "YES"
        let expectedTotalCost = 17
        let expectedPathSequence = [2,2,2,3,3]
        let leastCostMatrixProcessor = try! LeastCostPath(costMatrix: matrix)
        let path = leastCostMatrixProcessor.fetchLeastCostPath()
        
        XCTAssertTrue(expectedIsPathThrough == path?.isPathThroughGrid)
        XCTAssertTrue(expectedTotalCost == path?.totalCost)
        XCTAssertTrue(expectedPathSequence == (path?.rowPathSequence)!)
    }
    
}
