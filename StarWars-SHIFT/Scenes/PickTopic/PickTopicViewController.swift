//
//  PickTopicViewController.swift
//  StarWars-SHIFT
//
//  Created by Ivan Semenov on 29.01.2023.
//

import UIKit

final class PickTopicViewController: UIViewController {
    
    // MARK: - Private properties

    lazy private var topicCollection: UICollectionView = {
        let heightOfNavBar = self.navigationController?.navigationBar.bounds.height
        let layout = TopicLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.contentInset.top -= (heightOfNavBar ?? 0)
        return collectionView
    }()
    
    private let viewModel: PickTopicViewModel
    private let dataSource: PickTopicDataSource
    
    // MARK: - Inits
    
    init(viewModel: PickTopicViewModel) {
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
        
        setup()
        dataSource.configure(with: topicCollection)
        bindToViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupBackBarButtonItem()
    }
    
    //  MARK: - Setup
    
    private func setup() {
        setupSuperView()
        setupTopicCollection()
    }
    
    private func setupSuperView() {
        guard let backgroundImage = UIImage(named: "space") else { return }
        view.backgroundColor = UIColor(patternImage: backgroundImage)
    }
    
    private func setupTopicCollection() {
        view.addSubview(topicCollection)
        
        topicCollection.backgroundColor = .clear
        topicCollection.showsVerticalScrollIndicator = false
        
        topicCollection.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func setupBackBarButtonItem() {
        let backBarButtonItem = UIBarButtonItem(title: "Topics", style: .plain, target: self, action: nil)
        backBarButtonItem.tintColor = .appYellow
        self.navigationItem.backBarButtonItem = backBarButtonItem
    }
}

// MARK: - Building ViewModel

private extension PickTopicViewController {
    func bindToViewModel() {
        viewModel.goToShowTopicScreen = { [weak self] viewController in
            self?.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
