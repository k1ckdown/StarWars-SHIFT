//
//  TopicViewCell.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 30.01.2023.
//

import UIKit
import SnapKit

final class TopicViewCell: UICollectionViewCell {
    
    static let identifier = "TopicViewCell"
    
    override var isSelected: Bool {
        didSet {
            updateAppearance()
        }
    }
    
    // MARK: - Private properties
    
    private let topicImageView = UIImageView()
    private let nameTopicLabel = UILabel()
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = layer.frame.width / 3
        topicImageView.layer.cornerRadius = layer.cornerRadius
    }
    
    // MARK: - Public methods
    
    func configure(with viewModel: TopicViewCellViewModel) {
        let name = viewModel.getImageName()
        
        topicImageView.image = UIImage(named: name)
        nameTopicLabel.text = name.uppercased()
        nameTopicLabel.textColor = viewModel.getColorForTitle()
        
        layer.borderColor = nameTopicLabel.textColor.cgColor
    }
    
    // MARK: - Private methods
    
    private func updateAppearance() {
        alpha = isHighlighted ? 0.65 : 1.0
    }
    
    //  MARK: - Setup
    
    private func setup() {
        setupSuperView()
        setupTopicImageView()
        setupNameTopicLabel()
    }
    
    private func setupSuperView() {
        clipsToBounds = true
        layer.borderWidth = 1
    }
    
    private func setupTopicImageView() {
        addSubview(topicImageView)
        
        topicImageView.contentMode = .scaleAspectFill
        topicImageView.clipsToBounds = true
        
        topicImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupNameTopicLabel() {
        addSubview(nameTopicLabel)
        
        nameTopicLabel.font = UIFont.titleTopic
        nameTopicLabel.backgroundColor = .appLightBlack
        nameTopicLabel.textAlignment = .center
        
        nameTopicLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-15)
        }
    }
}
