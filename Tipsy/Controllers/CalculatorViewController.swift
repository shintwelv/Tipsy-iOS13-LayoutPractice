//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var bill: Float = 0.0
    var tipDecimal: Float = 0.1
    var numOfPeople: Int = 2
    var totalPerPerson: Float = 0.0

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        let title = sender.currentTitle!
        switch title {
        case "0%":
            tipDecimal = 0.0
        case "10%":
            tipDecimal = 0.1
        default:
            tipDecimal = 0.2
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%0.f", sender.value)
        numOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        bill = Float(billTextField.text!) ?? 0.0
        
        let billWithTip = bill * (1 + tipDecimal)
        totalPerPerson = billWithTip / Float(numOfPeople)
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let identifier = segue.identifier
        if identifier == "goToResult" {
            let resultVC = segue.destination as! ResultsViewController
            resultVC.totalPerPerson = totalPerPerson
            resultVC.numOfPeople = numOfPeople
            resultVC.tipPct = Int(tipDecimal*100)
        }
    }
}

