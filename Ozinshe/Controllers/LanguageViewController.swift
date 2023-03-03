//
//  LanguageViewController.swift
//  Ozinshe
//
//  Created by Nurasyl on 03.03.2023.
//

import UIKit
import Localize_Swift

protocol LanguageProtocol {
    func languageDidSelected()
}

class LanguageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate {
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var backgroundView: UIView!
    
    var delegate: LanguageProtocol?
    
    let languageArray = [["English", "en"], ["Русский", "ru"], ["Қазақша", "kk"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableview.delegate = self
        tableview.dataSource = self
        
        backgroundView.layer.cornerRadius = 32
        backgroundView.clipsToBounds = true
        backgroundView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissView))
        tap.delegate = self
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissView() {
        dismiss(animated: true, completion: nil)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of: backgroundView))! {
            return false
        }
        
        return true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = languageArray[indexPath.row][0]
        
        let checkImage = cell.viewWithTag(1001) as! UIImageView
        
        checkImage.image = nil
        
        if Localize.currentLanguage() == languageArray[indexPath.row][1] {
            checkImage.image = UIImage(named: "Check")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Localize.setCurrentLanguage(languageArray[indexPath.row][1])
        
        delegate?.languageDidSelected()
        
        dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
