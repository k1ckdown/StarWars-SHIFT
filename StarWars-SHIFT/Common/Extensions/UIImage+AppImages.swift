//
//  UIImage+AppImages.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 03.08.2023.
//

import UIKit

extension UIImage {
    
    enum AppImage: String {
        case space
        case starWars
        case rightArrow
    }
    
    convenience init?(_ image: AppImage) {
        self.init(named: image.rawValue)
    }
}
