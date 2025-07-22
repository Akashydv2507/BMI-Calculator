//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        // line number 25 is for reflect the height in developer screen
        print(String(format: "%.2f", sender.value))
        let height = String(format: "%.2f", sender.value)
        heightLabel.text = "\(height)m"
        
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        //line number 33 is for reflect the weight in developer screen
        print(String(format: "%.0f", sender.value))
        let weight = String(format: "%.0f", sender.value)
        weightLabel.text = "\(weight)kg"
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        print(heightSlider.value)
        print(weightSlider.value)
        let height = heightSlider.value
        let weight = weightSlider.value
        
        //let bmi = weight / (height*height)
      //  let bmi = weight / pow(height, 2)
        //print(bmi)
        //bmiValue = String(format: "%.1f", bmi)
        calculatorBrain.calculateBMI(height: height, weight: weight)
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
    
    
}

