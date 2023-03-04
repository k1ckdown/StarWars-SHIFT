//
//  DetailsScreenViewController.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 02.02.2023.
//

import UIKit

class DetailsScreenViewController: UIViewController {
    
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
    
    private let loadingIndicator = UIActivityIndicatorView()
    
    private let viewModel: DetailsScreenViewModel
    
    // MARK: - Inits
    
    init(viewModel: DetailsScreenViewModel) {
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
                
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
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
        setupSpeciesLabel()
        setupSpeciesButton()
        setupHomeworldLabel()
        setupHomeworldButton()
    }
    
    private func setupSuperView() {
        guard let backgroundImage = UIImage(named: "space") else { return }
        view.backgroundColor = UIColor(patternImage: backgroundImage)
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
        
        contentView.isHidden = viewModel.isHomeWorld() || viewModel.isSpecies()
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
    
    private func setupHeaderLabel() {
        contentView.addSubview(headerLabel)
        
        headerLabel.text = viewModel.getNameItem()
        headerLabel.textColor = .white
        headerLabel.font = UIFont.systemFont(ofSize: 30)
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
        
        contentImageView.image = UIImage(named: viewModel.getNameItem())
        contentImageView.contentMode = .scaleAspectFit
        
        contentImageView.snp.makeConstraints { make in
            make.top.equalTo(headerLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalToSuperview().multipliedBy(0.35)
        }
    }
    
    private func setupDetailsView() {
        contentView.addSubview(detailsView)
        
        detailsView.backgroundColor = .appLightBlack
        detailsView.layer.borderWidth = 1
        detailsView.layer.cornerRadius = 15
        detailsView.layer.borderColor = UIColor.darkGray.cgColor
        
        detailsView.snp.makeConstraints { make in
            make.top.equalTo(contentImageView.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(30)
            make.bottom.equalToSuperview()
        }
    }
    
    private func setupDetailsLabel() {
        detailsView.addSubview(detailsLabel)
        
        detailsLabel.text = viewModel.getDetailText()
        detailsLabel.textColor = .white
        detailsLabel.addInterlineSpacing(spacingValue: 8)
        detailsLabel.textAlignment = .left
        detailsLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        detailsLabel.textColor = .white
        detailsLabel.numberOfLines = 0
        
        if !viewModel.isSpecies() || !viewModel.isHomeWorld() {
            detailsLabel.snp.makeConstraints { make in
                make.height.equalTo(detailsLabel.retrieveTextHeight())
                make.edges.equalToSuperview().inset(15)
            }
        } else {
            detailsLabel.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(15)
                make.leading.trailing.equalToSuperview().inset(15)
                make.height.equalTo(detailsLabel.retrieveTextHeight())
            }
        }
    }
    
    private func setupSpeciesLabel() {
        guard viewModel.isSpecies() else { return }
        detailsView.addSubview(speciesLabel)
        
        speciesLabel.text = "Species: "
        speciesLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        speciesLabel.textAlignment = .left
        speciesLabel.isHidden = !viewModel.isSpecies()
        
        speciesLabel.snp.makeConstraints { make in
            make.top.equalTo(detailsLabel.snp.bottom).offset(-6)
            make.leading.equalTo(detailsLabel.snp.leading)
            make.height.equalTo(speciesLabel.retrieveTextHeight())
        }
    }
    
    private func setupSpeciesButton() {
        guard viewModel.isSpecies() else { return }
        detailsView.addSubview(speciesButton)
        
        speciesButton.setTitleColor(.white, for: .normal)
        speciesButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        speciesButton.isHidden = !viewModel.isSpecies()
        speciesButton.addTarget(self, action: #selector(handleSpeciesButton), for: .touchUpInside)
        
        speciesButton.snp.makeConstraints { make in
            make.leading.equalTo(speciesLabel.snp.trailing).offset(2)
            make.top.bottom.equalTo(speciesLabel)
        }
    }
    
    private func setupHomeworldLabel() {
        guard viewModel.isHomeWorld() else { return }
        detailsView.addSubview(homeworldLabel)
        
        homeworldLabel.text = "Homeworld: "
        homeworldLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        homeworldLabel.textAlignment = .left
        homeworldLabel.textColor = .white
        homeworldLabel.isHidden = !viewModel.isHomeWorld()
        
        homeworldLabel.snp.makeConstraints { make in
            make.top.equalTo(speciesLabel.snp.bottom).offset(6)
            make.leading.equalTo(detailsLabel.snp.leading)
            make.height.equalTo(homeworldLabel.retrieveTextHeight())
            make.bottom.equalToSuperview().inset(17)
        }
    }
    
    private func setupHomeworldButton() {
        guard viewModel.isHomeWorld() else { return }
        detailsView.addSubview(homeworldButton)
        
        homeworldButton.setTitleColor(.white, for: .normal)
        homeworldButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        homeworldButton.isHidden = !viewModel.isSpecies()
        homeworldButton.addTarget(self, action: #selector(handleHomeworldButton), for: .touchUpInside)
        
        homeworldButton.snp.makeConstraints { make in
            make.leading.equalTo(homeworldLabel.snp.trailing).offset(2)
            make.top.bottom.equalTo(homeworldLabel)
        }
    }
    
    private func setupLoadingIndicator() {
        
        view.addSubview(loadingIndicator)
        
        loadingIndicator.color = .appYellow
        loadingIndicator.style = .large
        loadingIndicator.center = view.center
        
        if viewModel.isSpecies() || viewModel.isHomeWorld() {
            loadingIndicator.startAnimating()
        }
    }
}

// MARK: - Building ViewModel

private extension DetailsScreenViewController {
    private func bindToViewModel() {
        viewModel.showModalWithDetails = { [weak self] modalWindow in
            self?.present(modalWindow, animated: true)
            let rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self?.closeDetailsModal))
            rightBarButtonItem.tintColor = .appYellow
            modalWindow.viewControllers.first?.navigationItem.rightBarButtonItem = rightBarButtonItem
        }
        
        viewModel.updateDetailsData = { [weak self] speciesName, homeworldName in
            self?.speciesButton.setTitle(speciesName, for: .normal)
            self?.homeworldButton.setTitle(homeworldName, for: .normal)
            
            self?.contentView.isHidden = false
            self?.loadingIndicator.stopAnimating()
            
            self?.updateButtonAppearance(button: self?.speciesButton)
            self?.updateButtonAppearance(button: self?.homeworldButton)
        }
        
        viewModel.showReceivedError = { [weak self] error in
            let alertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .cancel))
            self?.present(alertController, animated: true)
        }
    }
}
