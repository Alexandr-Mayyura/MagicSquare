//
//  ViewController.swift
//  MagicSquare
//
//  Created by Aleksandr Mayyura on 13.10.2022.
//

import UIKit

class MagicSquareViewController: UIViewController {

    @IBOutlet var firstLabel: UILabel!
    @IBOutlet var secondLabel: UILabel!
    @IBOutlet var thirdLabel: UILabel!
    @IBOutlet var forthLabel: UILabel!
    
    @IBOutlet var numberTextfield: UITextField!
    
    @IBOutlet var numberStackLabels: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberTextfield.delegate = self
        numberStackLabels.isHidden = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

// MARK: UITextFieldDelegate

extension MagicSquareViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        guard let number = Int(text) else { return }
        
        numberStackLabels.isHidden = false
        
        firstLabel.text = String(number - 20)
        secondLabel.text = String(number - 21)
        thirdLabel.text = String(number - 18)
        forthLabel.text = String(number - 19)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return false}
        let newText = (text as NSString).replacingCharacters(in: range, with: string)
        return newText.count < 3
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let flexingSpace = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )

        let doneAction = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: textField,
            action: #selector(resignFirstResponder)
        )

        toolBar.items = [flexingSpace, doneAction]
        textField.inputAccessoryView = toolBar
    }
}

