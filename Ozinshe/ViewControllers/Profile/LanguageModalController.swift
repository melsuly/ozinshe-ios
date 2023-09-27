//
// Created for Ozinshe in 2023
//

import UIKit
import Localize_Swift

protocol LanguageProtocol {
    func languageDidChange() -> Void
}

class LanguageModalController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var grabberView: UIView!

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
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LanguageCell", for: indexPath)

        let label = cell.viewWithTag(1000) as! UILabel

        label.text = languages[indexPath.row][1]

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

}
