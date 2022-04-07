//
//  ViewController.swift
//  MikeKondo-Kadai3
//
//  Created by 近藤米功 on 2022/04/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var number1TextField: UITextField!
    @IBOutlet private weak var number2TextField: UITextField!
    @IBOutlet private weak var number1Label: UILabel!
    @IBOutlet private weak var number2Label: UILabel!
    @IBOutlet private weak var calculatedResultLabel: UILabel!
    @IBOutlet private weak var number1Switch: UISwitch!
    @IBOutlet private weak var number2Switch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTextField()
    }

    @IBAction private func tappedCalculateButton(_ sender: Any) {
        let number1: Int = Int(number1TextField.text ?? "") ?? 0
        let number2: Int = Int(number2TextField.text ?? "") ?? 0
        let signedNumber1 = number1Switch.isOn ? -number1: number1
        let signedNumber2 = number2Switch.isOn ? -number2: number2
        number1Label.text = String(signedNumber1)
        number2Label.text = String(signedNumber2)
        calculatedResultLabel.text = String(signedNumber1 + signedNumber2)
    }

    private func setUpTextField() {
        number1TextField.delegate = self
        number2TextField.delegate = self
        number1TextField.keyboardType = .numberPad
        number2TextField.keyboardType = .numberPad
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
    }
}
