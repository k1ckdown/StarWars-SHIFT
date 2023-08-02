//
//  UIButton+Underline.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 04.02.2023.
//

import UIKit

extension UIButton {
    func underline() {
        guard let textString = titleLabel?.text else { return }
        
        let rangeSignUp = NSString(string: "\(textString)").range(of: "\(textString)", options: String.CompareOptions.caseInsensitive)
        let attributedString = NSMutableAttributedString(string: textString)
        attributedString.addAttributes([NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue as Any], range: rangeSignUp)
        setAttributedTitle(attributedString, for: .normal)
    }
}
