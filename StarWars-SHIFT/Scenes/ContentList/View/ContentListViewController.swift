//
//  ContentListViewController.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 31.01.2023.
//

import UIKit

final class ContentListViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let loadingIndicator = UIActivityIndicatorView()
    lazy private var contentCollection: UICollectionView = {
        let layout = ContentLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    private let viewModel: ContentListViewModel
    private let dataSource: ContentListDataSource
    
    // MARK: - Inits
    
    init(with viewModel: ContentListViewModel) {
        self.viewModel = viewModel
        dataSource = .init(viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = viewModel.getNameTopic()

        setup()
        dataSource.configure(with: contentCollection)
        bindToViewModel()
        viewModel.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupBackBarButtonItem()
    }
    
    //  MARK: - Setup
    
    private func setup() {
        setupSuperView()
        setupLoadingIndicator()
        setupContentCollection()
    }
    
    private func setupSuperView() {
        view.backgroundColor = .spaceBackground
    }
    
    private func setupContentCollection() {
        view.addSubview(contentCollection)
        
        contentCollection.delegate = self
        contentCollection.clipsToBounds = true
        contentCollection.backgroundColor = .clear
        contentCollection.showsVerticalScrollIndicator = false
        
        contentCollection.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalToSuperview()
        }
    }
    
    private func setupLoadingIndicator() {
        view.addSubview(loadingIndicator)
        
        loadingIndicator.style = .large
        loadingIndicator.startAnimating()
        loadingIndicator.color = .appYellow
        loadingIndicator.center = view.center
    }
    
    private func setupBackBarButtonItem() {
        let backBarButtonItem = UIBarButtonItem(title: viewModel.getNameTopic(), style: .plain, target: self, action: nil)
        backBarButtonItem.tintColor = .appYellow
        self.navigationItem.backBarButtonItem = backBarButtonItem
    }
}

// MARK: - UICollectionViewDelegate

extension ContentListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.moveToDetails(at: indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        viewModel.startDownloadingData(indexPath.item)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        willDisplaySupplementaryView view: UICollectionReusableView,
        forElementKind elementKind: String,
        at indexPath: IndexPath
    ) {
        guard elementKind == UICollectionView.elementKindSectionFooter else { return }
        viewModel.checkDownloadStatus()
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        didEndDisplayingSupplementaryView view: UICollectionReusableView,
        forElementOfKind elementKind: String,
        at indexPath: IndexPath
    ) {
        guard elementKind == UICollectionView.elementKindSectionFooter else { return }
        viewModel.checkDownloadStatus()
    }
    
}

// MARK: - Building ViewModel

private extension ContentListViewController {
    
    func bindToViewModel() {
        viewModel.updateCollectionData = { [weak self] in
            self?.contentCollection.reloadData()
            self?.loadingIndicator.stopAnimating()
        }
    }
    
}
