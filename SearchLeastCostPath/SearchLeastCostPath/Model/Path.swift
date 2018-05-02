//
//  LeastPath.swift
//  SearchLeastCostPath
//
//  Created by Saumiya on 28/04/18.
//  Copyright © 2018 Saumiya. All rights reserved.
//

/**
 Define the components required to display details of the Optimal path
 - path is through the grid
 - path total cost
 - rowPathSequence represent the rows traversed in the path
 */

import Foundation

struct Path {
    let isPathThroughGrid: String
    let totalCost: Int
    let rowPathSequence: [Int]
    
    var pathThroughDescription: String {
        return NSLocalizedString("Path through grid:", comment: "") + " \(self.isPathThroughGrid)"
    }
    var totalCostDescription: String {
        return  NSLocalizedString("Total cost:", comment: "") + " " + String(self.totalCost)
    }
    var pathSequenceDescription: String {
        return NSLocalizedString("Path sequence:", comment: "") + " [\(self.rowPathSequence.map { String($0) }.joined(separator: " "))]"
    }
}
