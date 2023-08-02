//
//  DetailsViewController.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 02.02.2023.
//

import UIKit

final class DetailsViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let headerLabel = UILabel()
    private let contentImageView = UIImageView()
    private let detailsView = UIView()
    
    private let detailsLabel = UILabel()
    private let homeworldLabel = UILabel()
    private let speciesLabel = UILabel()
    
    private let homeworldButton = UIButton()
    private let speciesButton = UIButton()
    
    private let loadingIndicatorView = LoadingIndicatorView()
    
    private let viewModel: DetailsViewModel
    
    // MARK: - Inits
    
    init(with viewModel: DetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        bindToViewModel()
        viewModel.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @objc
    private func handleSpeciesButton() {
        viewModel.showSpeciesDetails()
    }
    
    @objc
    private func handleHomeworldButton() {
        viewModel.showHomeworldDetails()
    }
    
    @objc
    private func closeDetailsModal() {
        dismiss(animated: true)
    }
    
    // MARK: - Private methods
    
    private func updateButtonAppearance(button: UIButton?) {
        guard let button = button else { return }
        guard !viewModel.isUnknown(button.titleLabel?.text) else { return }
                
        button.titleLabel?.font = .optionDetailsTitle
        button.setTitleColor(.appYellow, for: .normal)
        button.underline()
    }
    
    //  MARK: - Setup
    
    private func setup() {
        setupSuperView()
        setupLoadingIndicator()
        setupScrollView()
        setupContentView()
        setupHeaderLabel()
        setupContentImageView()
        setupDetailsView()
        setupDetailsLabel()
    }
    
    private func setupSuperView() {
        view.backgroundColor = .spaceBackground
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        
        scrollView.showsVerticalScrollIndicator = false
        
        scrollView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalToSuperview()
        }
    }
    
    private func setupContentView() {
        scrollView.addSubview(contentView)
      
        contentView.isHidden = true
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
    
    private func setupHeaderLabel() {
        contentView.addSubview(headerLabel)
        
        headerLabel.text = viewModel.nameItem
        headerLabel.textColor = .appWhite
        headerLabel.font = .headerDetailsTitle
        headerLabel.textAlignment = .center
        headerLabel.adjustsFontSizeToFitWidth = true
        headerLabel.minimumScaleFactor = 0.5
        
        headerLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(15)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(headerLabel.retrieveTextHeight())
        }
    }
    
    private func setupContentImageView() {
        contentView.addSubview(contentImageView)
        
        contentImageView.image = UIImage(named: viewModel.nameItem)
        contentImageView.contentMode = .scaleAspectFit
        
        contentImageView.snp.makeConstraints { make in
            make.top.equalTo(headerLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalToSuperview().multipliedBy(0.35)
        }
    }
    
    private func setupDetailsView() {
        contentView.addSubview(detailsView)
        
        detailsView.layer.borderWidth = 1
        detailsView.layer.cornerRadius = 15
        detailsView.layer.borderColor = UIColor.darkGray.cgColor
        detailsView.backgroundColor = .appBlack?.withAlphaComponent(0.47)
        
        detailsView.snp.makeConstraints { make in
            make.top.equalTo(contentImageView.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(30)
            make.bottom.equalToSuperview()
        }
    }
    
    private func setupDetailsLabel() {
        detailsView.addSubview(detailsLabel)
        
        detailsLabel.text = viewModel.detailText
        detailsLabel.textColor = .appWhite
        detailsLabel.addInterlineSpacing(spacingValue: 8)
        detailsLabel.textAlignment = .left
        detailsLabel.font = .detailsTitle
        detailsLabel.textColor = .appWhite
        detailsLabel.numberOfLines = 0
        
        if viewModel.isContainsOptionalInfo {
            detailsLabel.snp.makeConstraints { make in
                make.top.leading.trailing.equalToSuperview().inset(15)
                make.height.equalTo(detailsLabel.retrieveTextHeight())
            }
        } else {
            detailsLabel.snp.makeConstraints { make in
                make.height.equalTo(detailsLabel.retrieveTextHeight())
                make.edges.equalToSuperview().inset(15)
            }
        }
    }
    
    private func setupSpeciesLabel() {
        detailsView.addSubview(speciesLabel)
        
        speciesLabel.text = viewModel.speciesTitle
        speciesLabel.font = .detailsTitle
        speciesLabel.textAlignment = .left
        speciesLabel.textColor = .appWhite
        
        speciesLabel.snp.makeConstraints { make in
            make.top.equalTo(detailsLabel.snp.bottom).offset(-6)
            make.leading.equalTo(detailsLabel.snp.leading)
            make.height.equalTo(speciesLabel.retrieveTextHeight())
        }
    }
    
    private func setupSpeciesButton() {
        detailsView.addSubview(speciesButton)
        
        speciesButton.setTitleColor(.appWhite, for: .normal)
        speciesButton.titleLabel?.font = .detailsTitle
        speciesButton.addTarget(self, action: #selector(handleSpeciesButton), for: .touchUpInside)
        
        speciesButton.snp.makeConstraints { make in
            make.leading.equalTo(speciesLabel.snp.trailing).offset(2)
            make.top.bottom.equalTo(speciesLabel)
        }
    }
    
    private func setupHomeworldLabel() {
        detailsView.addSubview(homeworldLabel)
        
        homeworldLabel.text = viewModel.homeworldTitle
        homeworldLabel.font = .detailsTitle
        homeworldLabel.textAlignment = .left
        homeworldLabel.textColor = .appWhite
        
        homeworldLabel.snp.makeConstraints { make in
            make.top.equalTo(speciesLabel.snp.bottom).offset(6)
            make.leading.equalTo(detailsLabel.snp.leading)
            make.height.equalTo(homeworldLabel.retrieveTextHeight())
            make.bottom.equalToSuperview().inset(17)
        }
    }
    
    private func setupHomeworldButton() {
        detailsView.addSubview(homeworldButton)
        
        homeworldButton.setTitleColor(.appWhite, for: .normal)
        homeworldButton.titleLabel?.font = .detailsTitle
        homeworldButton.addTarget(self, action: #selector(handleHomeworldButton), for: .touchUpInside)
        
        homeworldButton.snp.makeConstraints { make in
            make.leading.equalTo(homeworldLabel.snp.trailing).offset(2)
            make.top.bottom.equalTo(homeworldLabel)
        }
    }
    
    private func setupLoadingIndicator() {
        view.addSubview(loadingIndicatorView)
        loadingIndicatorView.center = view.center
    }
    
    private func setupDoneButton() {
        let rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(closeDetailsModal))
        rightBarButtonItem.tintColor = .appYellow
        navigationItem.rightBarButtonItem = rightBarButtonItem
    }
}

// MARK: - Building ViewModel

private extension DetailsViewController {
    func bindToViewModel() {
        viewModel.showContent = { [weak self] in
            self?.contentView.isHidden = false
        }
        
        viewModel.showLoadingIndicator = { [weak self] in
            self?.loadingIndicatorView.startAnimating()
        }
        
        viewModel.applyModalWindowAppearance = { [weak self] in
            self?.setupDoneButton()
        }
        
        viewModel.showHomeworlnfo = { [weak self] in
            self?.setupHomeworldLabel()
            self?.setupHomeworldButton()
        }
        
        viewModel.showSpecieslnfo = { [weak self] in
            self?.setupSpeciesLabel()
            self?.setupSpeciesButton()
        }
        
        viewModel.updateDetailsData = { [weak self] speciesName, homeworldName in
            guard let self = self else { return }
            
            speciesButton.setTitle(speciesName, for: .normal)
            homeworldButton.setTitle(homeworldName, for: .normal)
            
            contentView.isHidden = false
            loadingIndicatorView.stopAnimating()
            
            updateButtonAppearance(button: speciesButton)
            updateButtonAppearance(button: homeworldButton)
        }
    }
}
