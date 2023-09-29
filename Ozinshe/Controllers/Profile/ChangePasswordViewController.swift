//
// Created for Ozinshe in 2023
//

import UIKit

class ChangePasswordViewController: UIViewController {
    @IBOutlet weak var passwordConfirmTextField: TextFieldWithPadding!
    @IBOutlet weak var passwordTextField: TextFieldWithPadding!
    @IBOutlet weak var saveButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViews()
    }

    func configureViews() {
        passwordTextField.layer.borderColor = UIColor(red: 0.9, green: 0.92, blue: 0.94, alpha: 1).cgColor
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.cornerRadius = 12

        passwordConfirmTextField.layer.borderColor = UIColor(red: 0.9, green: 0.92, blue: 0.94, alpha: 1).cgColor
        passwordConfirmTextField.layer.borderWidth = 1
        passwordConfirmTextField.layer.cornerRadius = 12

        saveButton.layer.cornerRadius = 12
    }

    @IBAction func textFieldEditingBegin(_ sender: UITextField) {
        sender.layer.borderColor = UIColor(red: 0.59, green: 0.33, blue: 0.94, alpha: 1).cgColor
    }

    @IBAction func textFieldEditingEnd(_ sender: UITextField) {
        sender.layer.borderColor = UIColor(red: 0.9, green: 0.92, blue: 0.94, alpha: 1).cgColor
    }

    @IBAction func togglePassword(_ sender: Any) {
        passwordTextField.isSecureTextEntry.toggle()
    }

    @IBAction func togglePasswordConfirm(_ sender: Any) {
        passwordConfirmTextField.isSecureTextEntry.toggle()
    }


    @IBAction func saveTouched(_ sender: Any) {
        // TODO: Password change request
    }
}
