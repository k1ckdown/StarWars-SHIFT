//
//  UIButton.swift
//  SHIFT_Project
//
//  Created by Ivan Semenov on 04.02.2023.
//

import Foundation
import UIKit

extension UIButton {
    func underline() {
         if let textString = self.titleLabel?.text {

             let rangeSignUp = NSString(string: "\(textString)").range(of: "\(textString)", options: String.CompareOptions.caseInsensitive)
             let attributedString = NSMutableAttributedString(string: textString)
             attributedString.addAttributes([NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue as Any], range: rangeSignUp)
             self.setAttributedTitle(attributedString, for: .normal)
         }

     }
}
