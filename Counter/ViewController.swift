//
//  ViewController.swift
//  Counter
//
//  Created by Artem Pereverzev on 27.03.2025.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: Project properties
    @IBOutlet private weak var logsTextField: UITextView!
    @IBOutlet private weak var labelCounter: UILabel!
    
    private var currentCounter: Int = 0
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        return formatter
    }()
    
    // MARK: Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Project methods starts here
    // Methods to increase/decrease counter of books
    private func increaseCounter() {
        currentCounter += 1
        
        labelCounter.text = "Значение счётчика: \(currentCounter)"
        logsTextField.text.append("\n[\(getDate())]: значение изменено на +1")
    }
    
    private func decreaseCounter() {
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
    private func resetCounter() {
        currentCounter = 0
        
        labelCounter.text = "Значение счётчика: \(currentCounter)"
        logsTextField.text.append("\n[\(getDate())]: значение сброшено")
    }
    
    // Method to get formatted date
    private func getDate() -> String {
        return dateFormatter.string(from: Date())
    }
    
    // MARK: Button handlers starts here
    @IBAction private func buttonIncreaseDidTouchDown(_ sender: Any) {
        increaseCounter()
    }
    
    @IBAction private func buttonDecreaseDidTouchDown(_ sender: Any) {
        decreaseCounter()
    }
    
    @IBAction private func buttonResetTouchDown(_ sender: Any) {
        resetCounter()
    }


}

