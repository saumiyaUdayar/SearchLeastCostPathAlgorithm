//
//  ValidationUtility.swift
//  SearchLeastCostPath
//
//  Created by Saumiya on 28/04/18.
//  Copyright © 2018 Saumiya. All rights reserved.
//

/**
 Validates the cost string with , and \n as delimiters does not contain special charater and then creates cost matrix
 */

import Foundation

class ValidationUtility {
    
    static func isValid(costInput: String) throws -> Bool {
        guard !costInput.isEmpty else {
            throw InputError.emptyInput
        }
        //Regular expression for allowed charaters
        let regex = try! NSRegularExpression(pattern: ".*[^0-9\n,-].*", options: NSRegularExpression.Options())
        //check if costString contains that does not match the pattern
        guard regex.matches(in: costInput, options: NSRegularExpression.MatchingOptions(), range: NSMakeRange(0, costInput.count)).isEmpty else {
            throw InputError.invalidInput
        }
            return true
    }
    
    /**
     Creates a cost matrix mXn from the input cost string with allowed delimiters , \n
     */
    static func createCostMatrixFrom(costInput: String) throws -> [[Int]]? {
        var costMatrixTemp = [[Int]]()
        var costArray = costInput.components(separatedBy: "\n")
        //remove \n if any at end of string
        if let lastElement = costArray.last, lastElement.isEmpty {
            costArray.removeLast()
        }
        for pathCost in costArray {
            if !pathCost.isEmpty {
                let costs = pathCost.components(separatedBy: ",")
                var pathCostArray = [Int]()
                for cost in costs {
                    //creates integer from string cost
                    if let costValue = Int(cost) {
                        pathCostArray.append(costValue)
                    } else {
                        throw InputError.invalidInput
                    }
                }
                if !pathCostArray.isEmpty {
                    costMatrixTemp.append(pathCostArray)
                }
            }
        }
        //Check if the input string creates a matrix with rows having equal columns mXn otherwise inadequate path cost provided
        let maxCols = costMatrixTemp.map { $0.count }.max()
        let maxRows = costMatrixTemp.count
        let costArrayCount = costMatrixTemp.flatMap { $0 }.count
        if let maxCols = maxCols, costArrayCount == maxCols * maxRows {
            return costMatrixTemp
        } else {
            throw InputError.invalidMatrixSize
        }
    }
    
}
