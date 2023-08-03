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
    }
    
    enum SystemImage: String {
        case rightArrow = "right-arrow"
    }
    
    convenience init?(_ image: AppImage) {
        self.init(named: image.rawValue)
    }
    
    convenience init?(_ systemImage: SystemImage) {
        self.init(systemName: systemImage.rawValue)
    }
}
