//
// Created for Ozinshe in 2023
//

import UIKit

class LogoutModalController: UIViewController {
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var grabberView: UIView!
    @IBOutlet weak var logoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }

    func configureViews() {
        backgroundView.layer.cornerRadius = 32
        backgroundView.layer.maskedCorners = [
            .layerMinXMinYCorner,
            .layerMaxXMinYCorner
        ]

        grabberView.layer.cornerRadius = 2.5

        logoutButton.layer.cornerRadius = 12
    }

    @IBAction func logoutTouched(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "accessToken")

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let loginNavigationController = storyboard?.instantiateViewController(withIdentifier: "LoginNavigationController")

        appDelegate.window?.rootViewController = loginNavigationController
    }

    @IBAction func cancelTouched(_ sender: Any) {
        dismiss(animated: true)
    }
}
