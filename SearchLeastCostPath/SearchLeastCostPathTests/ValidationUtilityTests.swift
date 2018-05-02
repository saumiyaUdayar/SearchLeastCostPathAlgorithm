//
//  ValidationUtilityTests.swift
//  SearchLeastCostPathTests
//
//  Created by Saumiya on 28/04/18.
//  Copyright © 2018 Saumiya. All rights reserved.
//

import XCTest
@testable import SearchLeastCostPath

class ValidationUtilityTests: XCTestCase {
    
    // Test for Empty user input for cost matrix
    func testValidateEmptyCostString() {
        XCTAssertThrowsError(try ValidationUtility.isValid(costInput: "")) { error in
            XCTAssertEqual(error as? InputError, InputError.emptyInput)
        }
    }
    
    // Test for Special character user input for cost matrix
    func testValidateSpecialCharaterCostString() {
        let cost = "1,2,3,7,2,9,$"
        XCTAssertThrowsError(try ValidationUtility.isValid(costInput: cost)) { error in
            XCTAssertEqual(error as? InputError, InputError.invalidInput)
        }
    }
    
    // Test for Negative user input for mXn cost matrix
    func testValidateNegativeCostString() {
        let cost = "1,2,3,7,2,9\n3,-5,3,22"
        let isValidInput = try? ValidationUtility.isValid(costInput: cost)
        XCTAssertTrue(isValidInput!)
    }

    
    // Test for inadequate cost input for mXn cost matrix
    func testCreateMatrixFromInadequateCostString() {
        let cost = "5,3,-6\n8,7,2,10"
        XCTAssertThrowsError(try ValidationUtility.createCostMatrixFrom(costInput: cost)) { error in
            XCTAssertEqual(error as? InputError, InputError.invalidMatrixSize)
        }
    }
    
    // Test for cost input for mXn cost matrix
    func testCreateMatrixFromExpectedString() {
        let cost = "11,3,-6,9\n8,7,2,10"
        let expectedCostMatrix = [[11,3,-6,9],
                                  [8,7,2,10]]
        let costMatrix = try! ValidationUtility.createCostMatrixFrom(costInput: cost)
        XCTAssertNotNil(costMatrix)
        XCTAssertEqual(expectedCostMatrix.flatMap{ $0 },(costMatrix?.flatMap {$0 })!)
    }
 
}
