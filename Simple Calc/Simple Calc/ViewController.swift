//
//  ViewController.swift
//  Simple Calc
//
//  Created by AT on 10/24/17.
//  Copyright © 2017 AT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    
    var firstText = ""
    var operationText = ""
    var secondText = ""
    var isFirst = true
    var firstTime = true
    var clear = false
    var isCount = false
    var isAvg = false
    var isFact = false
    var input = ""
    var count = 1
    var total = 0.0
    
    @IBAction func btnPressed(_ sender: UIButton) {
        input = sender.titleLabel!.text!
        if firstTime {
            firstTime = false
            resultLabel.text = input
        }
        if clear {
            resultLabel.text = input
            clear = false
        }
        if isFirst {
            firstText += input
            resultLabel.text! = firstText
        } else {
            secondText += input
            resultLabel.text! = secondText
        }
    }

    @IBAction func operationPressed(_ sender: UIButton) {
        operationText = sender.titleLabel!.text!
        clear = true
        isFirst = false
    }
    
    @IBAction func equalPressed(_ sender: UIButton) {
        if isCount {
            resultLabel.text = "\(count)"
        } else if isAvg {
            if isFirst {
                isFirst = false
                total += Double(firstText)!
                firstText = ""
            } else {
                isFirst = true
                total += Double(secondText)!
                secondText = ""
            }
            resultLabel.text = "\(total / Double(count))"
        } else {
            resultLabel.text = "\(calculate())"
        }
    }
    
    @IBAction func countPressed(_ sender: UIButton) {
        isCount = true
        count += 1
        if isFirst {
            resultLabel.text! = firstText
            isFirst = false
            firstText = ""
        } else {
            resultLabel.text! = secondText
            isFirst = true
            secondText = ""
        }
    }
    
    @IBAction func avgPressed(_ sender: UIButton) {
        isAvg = true
        count += 1
        if isFirst {
            isFirst = false
            total += Double(firstText)!
            firstText = ""
        } else {
            isFirst = true
            total += Double(secondText)!
            secondText = ""
        }
    }
    
    @IBAction func factPressed(_ sender: UIButton) {
        resultLabel.text = "\(fact())"
    }
    
    func fact() -> Int {
        var result = 1
        var answer = Int(firstText)!
        while answer > 1 {
            result *= answer
            answer -= 1
        }
        return result
    }
    
    func calculate() -> Double {
        let first = Double(firstText)!
        let second = Double(secondText)!
        firstText = ""
        secondText = ""
        switch operationText {
        case "+":
            return first + second
        case "-":
            return first - second
        case "*":
            return first * second
        case "/":
            return first / second
        case "%":
            return first.truncatingRemainder(dividingBy: second)
        default:
            return 0
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

