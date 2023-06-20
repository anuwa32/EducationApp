//
//  CalculateController.swift
//  EducationApp
//
//  Created by anupriya on 2023-04-19.
//

import Foundation
import UIKit

var calHours = Int()
var noOfDays = Int()

class CalculateController: UIViewController {
    
    @IBOutlet weak var txtDays: UITextField!
    
    @IBOutlet weak var txtHours: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func txtButton(_ sender: Any) {
        let noOfDaysString = txtDays.text ?? ""
        let calHoursString = txtHours.text
        
        if noOfDaysString.isEmpty {
            let alert = UIAlertController(title: "Error", message: "Number of days cannot be empty", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            txtHours.text = ""
            
        }else if let days = Int(noOfDaysString) {
            if days == 0 {
                let alert = UIAlertController(title: "Error", message: "Number of days cannot be zero", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
                txtHours.text = ""
            }else if days < 0{
                let alert = UIAlertController(title: "Error", message: "Number of days cannot be negative", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
                txtHours.text = ""
            }else {
                let val = convertDaysToHours(noOfDays: days)
                txtHours.text = "\(val)"
            }
        }else {
            let alert = UIAlertController(title: "Error", message: "Please enter a valid positive number", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            txtHours.text = ""
        }
    }
    
    func convertDaysToHours(noOfDays: Int) -> String {
        calHours = noOfDays * 24
        return "\(calHours)"
    }
}
