//
//  TopicViewCellViewModel.swift
//  SHIFT_StarWars
//
//  Created by Ivan Semenov on 01.02.2023.
//

import Foundation
import UIKit

final class TopicViewCellViewModel {
    
    // MARK: - Public properties
    
    let imageName: String
    let colorForTitle: UIColor
    
    // MARK: - Inits
    
    init(imageName: String, color: UIColor) {
        self.imageName = imageName
        self.colorForTitle = color
    }
    
    // MARK: - Public methods
    
    func getImageName() -> String {
        return imageName
    }
    
    func getColorForTitle() -> UIColor {
        return colorForTitle
    }
}
