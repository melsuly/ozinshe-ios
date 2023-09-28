//
// Created for Ozinshe in 2023
//

import UIKit
import Localize_Swift

protocol LanguageProtocol {
    func languageDidChange() -> Void
}

class LanguageModalController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var grabberView: UIView!

    var viewTranslation = CGPoint(x: 0, y: 0)

    var delegate: LanguageProtocol?

    var languages = [
        ["en", "English"],
        ["kk", "Қазақша"],
        ["ru", "Русский"]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViews()
    }

    func configureViews() {
        tableView.dataSource = self
        tableView.delegate = self

        backgroundView.layer.cornerRadius = 32
        backgroundView.layer.maskedCorners = [
            .layerMinXMinYCorner,
            .layerMaxXMinYCorner
        ]

        grabberView.layer.cornerRadius = 2.5

        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(cancelTouched))

        tapRecognizer.delegate = self

        view.addGestureRecognizer(tapRecognizer)
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handleDismiss)))
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LanguageCell", for: indexPath)

        let label = cell.viewWithTag(1000) as! UILabel

        label.text = languages[indexPath.row][1]

        let checkImageView = cell.viewWithTag(1001) as! UIImageView

        checkImageView.isHidden = Localize.currentLanguage() != languages[indexPath.row][0]

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Localize.setCurrentLanguage(languages[indexPath.row][0])

        delegate?.languageDidChange()

        dismiss(animated: true)
    }

    @objc func cancelTouched() {
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
