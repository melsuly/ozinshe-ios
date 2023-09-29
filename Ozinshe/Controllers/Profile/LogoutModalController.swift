//
// Created for Ozinshe in 2023
//

import UIKit

class LogoutModalController: UIViewController, UIGestureRecognizerDelegate {
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var grabberView: UIView!
    @IBOutlet weak var logoutButton: UIButton!

    var viewTranslation = CGPoint(x: 0, y: 0)
    
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

        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(cancelTouched))

        tapRecognizer.delegate = self

        view.addGestureRecognizer(tapRecognizer)
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handleDismiss)))
    }

    @IBAction func logoutTouched(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "accessToken")

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let loginNavigationController = storyboard?.instantiateViewController(withIdentifier: "LoginNavigationController")

        appDelegate.window?.rootViewController = loginNavigationController
    }

    @IBAction func cancelTouched() {
        dismiss(animated: true)
    }

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return !(touch.view?.isDescendant(of: backgroundView))!
    }

    @objc func handleDismiss(sender: UIPanGestureRecognizer) {
        switch sender.state {
            case .changed:
                viewTranslation = sender.translation(in: view)
                UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    if self.viewTranslation.y > 0 {
                        self.backgroundView.transform = CGAffineTransform(translationX: 0, y: self.viewTranslation.y)
                    }
                })
            case .ended:
                if viewTranslation.y < 100 {
                    UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                        self.backgroundView.transform = .identity
                    })
                } else {
                    cancelTouched()
                }
            default:
                break
        }
    }
}
