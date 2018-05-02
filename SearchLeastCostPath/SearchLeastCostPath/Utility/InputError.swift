//
//  Constant.swift
//  SearchLeastCostPath
//
//  Created by Saumiya on 29/04/18.
//  Copyright © 2018 Saumiya. All rights reserved.
//

import Foundation

enum InputError: Error {
    case invalidInput
    case invalidMatrixSize
    case emptyInput
    
    var message: String {
        switch self {
        case .invalidInput:
            return NSLocalizedString("Invalid characters", comment: "")
        case .invalidMatrixSize:
            return NSLocalizedString("Matrix size incorrect", comment: "")
        case .emptyInput:
            return NSLocalizedString("Matrix cannot be empty", comment: "")
        }
    }
    
}
