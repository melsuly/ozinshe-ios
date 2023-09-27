//
// Created for Ozinshe in 2023
//

import UIKit

class TextFieldWithPadding: UITextField {
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 0))
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 0))
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 0))
    }
}
