//
// Created for Ozinshe in 2023
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var emailLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }

    func configureViews() {
        emailLabel.text = Storage.shared.userEmail
    }

    @IBAction func personalDataTouched(_ sender: Any) {
    }

    @IBAction func changePasswordTouched(_ sender: Any) {
    }

    @IBAction func changeLanguageTouched(_ sender: Any) {
    }

    @IBAction func themeSwitchValueChanged(_ sender: UISwitch) {
        // TODO: Theme switch
        print("Is dark theme: \(sender.isOn)")
    }

    @IBAction func logoutTouched(_ sender: Any) {
        let logoutModalController = storyboard?.instantiateViewController(identifier: "LogoutModalController") as! LogoutModalController

        logoutModalController.modalPresentationStyle = .overFullScreen

        present(logoutModalController, animated: true)
    }
}
