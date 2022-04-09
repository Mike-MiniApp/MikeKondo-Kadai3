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

    private var numberTextFields: [UITextField] {
        [number1TextField, number2TextField]
    }

    private var numberSwitches: [UISwitch] {
        [number1Switch, number2Switch]
    }

    private var numberLabels: [UILabel] {
        [number1Label, number2Label]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTextField()
    }

    @IBAction private func tappedCalculateButton(_ sender: Any) {
        let numbers = numberTextFields.map {
            Int($0.text ?? "") ?? 0
        }

        let signedNumbers = zip(numberSwitches, numbers).map {
            $0.isOn ? -$1 : $1
        }

        zip(numberLabels, signedNumbers).forEach {
            $0.text = String($1)
        }

        calculatedResultLabel.text = String(signedNumbers.reduce(0, +))
    }

    private func setUpTextField() {
        numberTextFields.forEach {
            $0.delegate = self
        }
        numberTextFields.forEach {
            $0.keyboardType = .numberPad
        }
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
    }
}
