//
//  ContentViewCell.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 01.02.2023.
//

import UIKit

final class ContentViewCell: UICollectionViewCell {
    
    static let identifier = "ContentViewCell"
    
    // MARK: - Private properties
    
    private let contentImageView = UIImageView()
    private let titleView = UIView()
    private let mainTitleLabel = UILabel()
    private let subTitleLabel = UILabel()
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public methods
    
    func configure(with viewModel: ContentViewCellViewModel) {
        contentImageView.image = UIImage(named: viewModel.name)
        mainTitleLabel.text = viewModel.name
        subTitleLabel.text = viewModel.subTitle
        subTitleLabel.isHidden = !viewModel.shouldShowSubTitle
        
        if subTitleLabel.isHidden {
            mainTitleLabel.snp.makeConstraints { make in
                make.centerY.equalToSuperview()
            }
        }
    }
    
    //  MARK: - Setup
    
    private func setup() {
        setupSuperView()
        setupContentImageView()
        setupTitleView()
        setupMainTitleLabel()
        setupSubTitleLabel()
    }
    
    private func setupSuperView() {
        backgroundColor = .white
        layer.cornerRadius = 10
        clipsToBounds = true
    }
    
    private func setupContentImageView() {
        addSubview(contentImageView)
        
        contentImageView.contentMode = .scaleAspectFill
        contentImageView.clipsToBounds = true
        
        contentImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.75)
        }
    }
    
    private func setupTitleView() {
        addSubview(titleView)
        titleView.backgroundColor = .clear
        
        titleView.snp.makeConstraints { make in
            make.top.equalTo(contentImageView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func setupMainTitleLabel() {
        titleView.addSubview(mainTitleLabel)
        
        mainTitleLabel.textAlignment = .center
        mainTitleLabel.textColor = .black
        mainTitleLabel.font = UIFont.systemFont(ofSize: 16)
        mainTitleLabel.backgroundColor = .white
        mainTitleLabel.adjustsFontSizeToFitWidth = true
        mainTitleLabel.minimumScaleFactor = 0.5
        
        mainTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(self.bounds.height/15)
            make.leading.trailing.equalToSuperview().inset(3)
        }
    }
    
    private func setupSubTitleLabel() {
        titleView.addSubview(subTitleLabel)
        
        subTitleLabel.textAlignment = .center
        subTitleLabel.textColor = .darkGray
        subTitleLabel.font = UIFont.systemFont(ofSize: 11)
        subTitleLabel.backgroundColor = .white
        
        subTitleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(mainTitleLabel.snp.bottom).offset(3)
        }
    }
}
