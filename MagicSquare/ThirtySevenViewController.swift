//
//  ThirtySevenViewController.swift
//  MagicSquare
//
//  Created by Aleksandr Mayyura on 16.10.2022.
//

import UIKit

class ThirtySevenViewController: UIViewController {

    @IBOutlet var sumLabel: UILabel!
    @IBOutlet var divisionLabel: UILabel!
    
    @IBOutlet var numberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberTextField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

extension ThirtySevenViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
      let sum = (Int(text) ?? 0) * 3
      let sumIn = (Int(text) ?? 0) * 111
        
        sumLabel.text = " \(text) + \(text) + \(text) = \(sum) "
        
        divisionLabel.text = " \(sumIn) / \(sum) = "
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return false }
        let newText = (text as NSString).replacingCharacters(in: range, with: string)
        return newText.count < 2
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let flexSpaser = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: textField,
            action: #selector(resignFirstResponder)
        )
        
        toolBar.items = [flexSpaser, doneButton]
        textField.inputAccessoryView = toolBar
    }
    
}
