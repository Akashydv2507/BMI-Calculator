//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Akash Yadav on 22/07/25.
//

import UIKit

struct CalculatorBrain {
    var bmi: BMI?
    
    func getBMIValue() -> String {
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmiTo1DecimalPlace
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice yet!"
    }
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.blue
    }
    
    mutating func calculateBMI(height: Float, weight: Float){
       // bmi = weight / (height*height)
        let bmiValue = weight / pow(height, 2)
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Underweight && Eat more pies!", color: UIColor.blue )
        }else if bmiValue < 25 {
            bmi = BMI(value: bmiValue, advice: "Normal && Fit as a fiddle!", color: UIColor.green )
        } else{
            bmi = BMI(value: bmiValue, advice: "Overweight && Eat less pies!", color: UIColor.red )
        }
        
    }
}
