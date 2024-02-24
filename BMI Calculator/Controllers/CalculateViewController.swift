//
//  ViewController.swift
//  BMI Calculator
//
//  Updated by Maksim Stogniy on 24.02.2024
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    
    var calculatorBrain = CalculatorBrain()
    
    var bmiValue = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightChange(_ sender: UISlider) {
        let formatedValue = String(format: "%.2f", sender.value)
        heightLabel.text = "\(formatedValue)Kg"
    }
    
    @IBAction func weightChange(_ sender: UISlider) {
        let formatedValue = String(format: "%.0f", sender.value)
        weightLabel.text = "\(formatedValue)Kg"
    }
    @IBAction func calculateHandler(_ sender: UIButton) {
        calculatorBrain.calculateBMI(height: heightSlider.value, weight: weightSlider.value)
        
        self.performSegue(withIdentifier: "goToResulats", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResulats" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
}

