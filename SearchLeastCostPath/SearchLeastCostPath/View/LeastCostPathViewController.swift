//
//  LeastCostPathViewController.swift
//  SearchLeastCostPath
//
//  Created by Saumiya on 28/04/18.
//  Copyright © 2018 Saumiya. All rights reserved.
//

import UIKit

class LeastCostPathViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var isPathThrough: UILabel!
    @IBOutlet weak var totalCost: UILabel!
    @IBOutlet weak var pathSequence: UILabel!
    @IBOutlet weak var inputTextView: UITextView!
    @IBOutlet weak var findPathButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    //MARK: - View Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - IBAction
    
    /**
     User Input string is send to the PathCostProcessor to process and return the least cost path from the cost matrix provided
     */
    
    @IBAction func findPath(_ sender: Any) {
        
        //Intiates the search for path in cost matrix
        do {
            if try ValidationUtility.isValid(costInput: self.inputTextView.text), let matrix = try ValidationUtility.createCostMatrixFrom(costInput: self.inputTextView.text) {
                
                let leastCostPath = try LeastCostPath(costMatrix: matrix)
                let path = leastCostPath.fetchLeastCostPath()
                
                //Validates the path and display output
                self.isPathThrough.text = path?.pathThroughDescription ?? ""
                self.totalCost.text = path?.totalCostDescription ?? ""
                self.pathSequence.text = path?.pathSequenceDescription ?? ""
            }
        } catch {
            let inputError = error as! InputError
            self.showErrorAlert(message: inputError.message)
        }
        
    }
    
    /**
     - Reset Output and TextView
     */
    @IBAction func reset(_ sender: Any) {
        self.inputTextView.text = ""
        self.resetOutput()
    }
    
    //MARK: - Handle Error with alert
    private func showErrorAlert(message: String) {
        self.resetOutput()
        //Display error in cost matrix input
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: - Reset output
    private func resetOutput() {
        self.isPathThrough.text = ""
        self.totalCost.text = ""
        self.pathSequence.text = ""
    }
}
