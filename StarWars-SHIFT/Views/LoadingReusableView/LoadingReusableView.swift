//
//  LoadingReusableView.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 03.02.2023.
//

import UIKit

final class LoadingReusableView: UICollectionReusableView , ReuseIdentifier {
    
    // MARK: - Private properties
        
    private let loadingIndicatorView = LoadingIndicatorView()
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public methods
    
    func start() {
        loadingIndicatorView.startAnimating()
    }
    
    func stop() {
        loadingIndicatorView.stopAnimating()
    }
    
    //  MARK: - Setup
    
    private func setup() {
        addSubview(loadingIndicatorView)
        
        loadingIndicatorView.style = .medium
        
        loadingIndicatorView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(20)
        }
    }
}
