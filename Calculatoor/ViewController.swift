//
//  ViewController.swift
//  Calculatoor
//
//  Created by Justine Probst on 17.03.18.
//  Copyright © 2018 Justine Probst. All rights reserved.
//

import UIKit

enum Operation:String {
    case Add = "+"
    case Substract = "-"
    case Divide = "/"
    case Multiply = "*"
    case NULL = "Null"
}

class ViewController: UIViewController {

    @IBOutlet weak var outputLbl: UILabel!
    
    var runningNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var currentOperation:Operation = .NULL
    
    override func viewDidLoad() {
        super.viewDidLoad()

        outputLbl.text = "0"
    }


    @IBAction func numberPressed(_ sender: UIButton) {
        if runningNumber.count <= 8 {
            runningNumber += "\(sender.tag)"
            outputLbl.text = runningNumber
        }

    }
    
    @IBAction func allClearPressed(_ sender: UIButton) {
        runningNumber = ""
        leftValue = ""
        rightValue = ""
        result = ""
        currentOperation = .NULL
        outputLbl.text = "0"
    }
    
    @IBAction func dotPressed(_ sender: UIButton) {
        if runningNumber.count <= 7 {
            runningNumber += "."
            outputLbl.text = runningNumber
        }

    }
    @IBAction func equalPressed(_ sender: UIButton) {
        operation(operation: currentOperation)
    }
    
    @IBAction func addPressed(_ sender: UIButton) {
        operation(operation: .Add)
    }
    
    @IBAction func minusPressed(_ sender: UIButton) {
        operation(operation: .Substract)
    }
    
    @IBAction func multPressed(_ sender: UIButton) {
        operation(operation: .Multiply)
    }
    
    @IBAction func divPressed(_ sender: UIButton) {
        operation(operation: .Divide)
    }
    
    func operation(operation: Operation) {
        if currentOperation != .NULL {
            if runningNumber != "" {
                rightValue = runningNumber
                runningNumber = ""
                
                if currentOperation == .Add {
                    result = "\(Double(leftValue)! + Double(rightValue)!)"
                } else if currentOperation == .Substract {
                    result = "\(Double(leftValue)! - Double(rightValue)!)"
                } else if currentOperation == .Multiply {
                    result = "\(Double(leftValue)! * Double(rightValue)!)"
                } else if currentOperation == .Divide {
                    result = "\(Double(leftValue)! / Double(rightValue)!)"
                }
                leftValue = result
                if(Double(result)!.truncatingRemainder(dividingBy: 1) == 0) {
                    result = "\(Int(Double(result)!))"
                }
                outputLbl.text = result
            }
            currentOperation = operation
        } else {
            leftValue = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
}

