//
//  LeastCostPath.swift
//  SearchLeastCostPath
//
//  Created by Udaiyar, Saumiya on 4/28/18.
//  Copyright © 2018 Saumiya. All rights reserved.
//

import Foundation

class LeastCostPath {
    //Max rows defines the rows in cost matrix
    let maxRows: Int
    
    //Max columns in the cost matrix and allowed path length
    let maxColumns: Int
    
    //Cost Matrix stores the cost
    var costMatrix: [[Int]]
    
    //Maximum cost limit for a path
    let MAX_COST_LIMIT = 50
    
    typealias CostIndex = (cost: Int?, index: Index?)
    
    init(costMatrix: [[Int]]) throws {
        guard !costMatrix.isEmpty else {
            throw InputError.emptyInput
        }
        self.costMatrix = costMatrix
        self.maxRows = self.costMatrix.count
        self.maxColumns = self.costMatrix.first?.count ?? 0
    }
    
    /**
     - Fetch the least cost from the cost matrix
     - Ends search for cost if cost exceeds max path limit
     - Traces the path for traversed cost matrix
     - Returns Path
     */
    
    func fetchLeastCostPath() -> Path? {
        var path: Path?
        var traversedColumn = -1
        for column in 0..<self.maxColumns {
            if self.canProcessCostFor(column: column) {
                traversedColumn = column
            } else {
                break
            }
        }
        path = self.getPathForTraversed(column: traversedColumn)
        return path
    }
    
    /**
     - From the processed cost matrix until the column reached
     - Finds the minimum cost previous adjacent column minimum
     - Returns Path
     */
    
    private func getPathForTraversed(column: Int) -> Path? {
        guard column > -1, let costIndex = getMinimumCostIndicesFrom(column: column), let totalCost = costIndex.cost, let finalPathIndex = costIndex.index else {
            //Return if no path found
            return Path(isPathThroughGrid: "NO", totalCost: 0, rowPathSequence: [])
        }
        var traverseSequence = [Index]()
        var minCostLastIndex = finalPathIndex
        traverseSequence.append(finalPathIndex)
        var currentColumn = column
        //Traverse reverse columns
        while currentColumn > 0 {
            if let previousAdjacentIndex = self.getPreviousPossiblePathsFor(index: minCostLastIndex) {
                if let adjacentMinimumCostIndex = getMinimumCostFrom(indices: previousAdjacentIndex).index {
                    //Append Index with minimum cost
                    traverseSequence.append(adjacentMinimumCostIndex)
                    minCostLastIndex = adjacentMinimumCostIndex
                }
            }
            currentColumn -= 1
        }
        
        let rowSequence: [Int] = traverseSequence.map { $0.row + 1 }.reversed()
        let isPathThrough = rowSequence.count == self.maxColumns ? "YES" : "NO"
        
        return Path(isPathThroughGrid: isPathThrough, totalCost: totalCost, rowPathSequence: rowSequence)
    }
    
    /**
     - Processes the cost matrix for the given column
     - updates the cost to reach the column through the least cost previous adjacent column
     - Returns false if path exceeds the max cost limit
     */
    
    private  func canProcessCostFor(column: Int) -> Bool {
        var currentColumnPathCost = [Int]()
        for rowIndex in 0..<self.maxRows {
            let currentIndex = Index(row: rowIndex, column: column)
            if let previousAdjacentIndex = self.getPreviousPossiblePathsFor(index: currentIndex), !previousAdjacentIndex.isEmpty {
                if let minimumPreviousAdjacentCost = self.getMinimumCostFrom(indices: previousAdjacentIndex).cost {
                    self.costMatrix[rowIndex][column] += minimumPreviousAdjacentCost
                }
            }
            currentColumnPathCost.append(self.costMatrix[rowIndex][column])
        }
        let canTraverseAhead = currentColumnPathCost.filter { $0 > MAX_COST_LIMIT }.count != self.maxRows
        return canTraverseAhead
    }
    
    /**
     - Finds the minimum cost in the cost matrix for the column
     - Returns the minimum cost and the Index row, column in cost matrix
     */
    
    private  func getMinimumCostIndicesFrom(column: Int) -> CostIndex? {
        var minimumCostIndex: Index?
        var minimumCost: Int?
        for row in 0..<self.maxRows {
            if minimumCost == nil {
                minimumCost = self.costMatrix[row][column]
                minimumCostIndex = Index(row: row, column: column)
            } else {
                if let cost = minimumCost, self.costMatrix[row][column] < cost {
                    minimumCost = self.costMatrix[row][column]
                    minimumCostIndex = Index(row: row, column: column)
                }
            }
        }
        return (cost: minimumCost, index: minimumCostIndex)
    }
    
    /**
     - Searches previous possible path to reach the given index
     - Returns array of possible Index
     */
    
    private  func getPreviousPossiblePathsFor(index: Index) -> [Index]? {
        let previousColumn = index.column - 1
        // No path exists if column is 0
        guard previousColumn > -1, index.row < self.maxRows, index.column < self.maxColumns else { return nil }
        
        var adjacentPreviousIndex = [Index]()
        //diagonal top row
        let topPreviousRow = index.row - 1 < 0 ? self.maxRows - 1 : index.row - 1
        //diagonal bottom row
        let bottomPreviousRow = index.row + 1 == self.maxRows ? 0 : index.row + 1
        
        adjacentPreviousIndex.append(Index(row: topPreviousRow , column: previousColumn))
        adjacentPreviousIndex.append(Index(row: index.row, column: previousColumn))
        adjacentPreviousIndex.append(Index(row: bottomPreviousRow, column: previousColumn))
        
        return adjacentPreviousIndex
    }
    
    /**
     - Searches for minimum cost from the given Index array
     - Returns Cost and its position
     */
    func getMinimumCostFrom(indices: [Index]) -> CostIndex {
        var minimumCost: Int?
        var minimumCostIndex: Index?
        for position in indices {
            if minimumCost == nil {
                minimumCost = self.costMatrix[position.row][position.column]
                minimumCostIndex = position
            } else {
                if let cost = minimumCost, self.costMatrix[position.row][position.column] < cost {
                    minimumCost = self.costMatrix[position.row][position.column]
                    minimumCostIndex = position
                }
            }
        }
        return (cost: minimumCost, index: minimumCostIndex)
    }
}
