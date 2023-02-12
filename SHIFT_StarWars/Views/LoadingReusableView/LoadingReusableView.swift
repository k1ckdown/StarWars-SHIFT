//
//  LoadingReusableView.swift
//  SHIFT_StarWars
//
//  Created by Ivan Semenov on 03.02.2023.
//

import UIKit

final class LoadingReusableView: UICollectionReusableView {
    
    static let identifier = "LoadingReusableView"
    
    // MARK: - Public properties
        
    let activityIndicator = UIActivityIndicatorView()
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //  MARK: - Setup
    
    private func setup() {
        backgroundColor = .clear
        addSubview(activityIndicator)
        
        activityIndicator.color = .appYellow
        
        activityIndicator.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(20)
        }
    }
}
