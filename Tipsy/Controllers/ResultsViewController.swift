//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by ShinIl Heo on 2022/09/06.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var totalPerPerson: Float = 0.0
    var tipPct = 0
    var numOfPeople = 1
    
    override func viewDidLoad() {
        totalLabel.text = String(format: "%.1f", totalPerPerson)
        settingsLabel.text = "Split between \(numOfPeople), with \(tipPct)% tip"
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
