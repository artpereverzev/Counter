//
//  ViewController.swift
//  Counter
//
//  Created by Artem Pereverzev on 27.03.2025.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Project properties
    @IBOutlet weak var logsTextField: UITextView!
    @IBOutlet weak var labelCounter: UILabel!
    
    var currentCounter: Int = 0
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        return formatter
    }()
   
    // MARK: Button handlers starts here
    @IBAction func buttonIncreaseDidTouchDown(_ sender: Any) {
        increaseCounter()
    }
    
    @IBAction func buttonDecreaseDidTouchDown(_ sender: Any) {
        decreaseCounter()
    }
    
    @IBAction func buttonResetTouchDown(_ sender: Any) {
        resetCounter()
    }
    
    // MARK: Project methods starts here
    // Methods to increase/decrease counter of books
    func increaseCounter() {
        currentCounter += 1
        
        labelCounter.text = "Значение счётчика: \(currentCounter)"
        logsTextField.text.append("\n[\(getDate())]: значение изменено на +1")
    }
    
    func decreaseCounter() {
        if currentCounter > 0 {
            currentCounter -= 1
            
            labelCounter.text = "Значение счётчика: \(currentCounter)"
            logsTextField.text.append("\n[\(getDate())]: значение изменено на -1")
        } else {
            logsTextField.text.append("\n[\(getDate())]: попытка уменьшить значение счётчика ниже 0")
            return
        }
    }
    
    // Method to reset counter
    func resetCounter() {
        currentCounter = 0
        
        labelCounter.text = "Значение счётчика: \(currentCounter)"
        logsTextField.text.append("\n[\(getDate())]: значение сброшено")
    }
    
    // Method to get formatted date
    func getDate() -> String {
        return dateFormatter.string(from: Date())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

