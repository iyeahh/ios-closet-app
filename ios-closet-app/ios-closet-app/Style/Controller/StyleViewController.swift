//
//  StyleViewController.swift
//  ios-closet-app
//
//  Created by Bora Yang on 2023/05/24.
//

import UIKit

class StyleViewController: UIViewController {
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
    private var dataSource: UICollectionViewDiffableDataSource<Section,Clothes>?
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Clothes>
    private var sections = Section.styleSection

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        setUI()
        collectionView.register(StyleCollectionViewCell.self, forCellWithReuseIdentifier: StyleCollectionViewCell.reuseIdentifier)
        collectionView.setCollectionViewLayout(createLayout(), animated: true)
        setDataSource()
        applySnapshot()
    }

    private func setUI() {
        view.backgroundColor = .lightGray

        let titleLabel = UILabel()
        titleLabel.textColor = .black
        titleLabel.text = "MY CLOTHES"
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLabel)

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .add)

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        self.view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func createLayout() -> UICollectionViewLayout {
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 30
        return UICollectionViewCompositionalLayout(sectionProvider: {[weak self] sectionIndex, _ in
            return self?.createSection()
        }, configuration: config)
    }

    private func createSection() -> NSCollectionLayoutSection {
        // item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

        // group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(220))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        // section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20)
        return section
    }

    private func setDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section,Clothes>(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in

            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StyleCollectionViewCell.reuseIdentifier, for: indexPath) as? StyleCollectionViewCell else { return UICollectionViewCell()}
            cell.configureUI(imageUrl: "https://assets.burberry.com/is/image/Burberryltd/DAE977F2-E43C-4931-B200-547E02C0DE89?$BBY_V2_SL_1x1$&wid=200&hei=200", text: "아이예의 옷장")
            return cell
        })
    }

    func applySnapshot(animatingDifferences: Bool = true) {
        var snapshot = Snapshot()
        snapshot.appendSections(sections)
        sections.forEach { section in
            snapshot.appendItems(section.clothes, toSection: section)
        }
        dataSource?.apply(snapshot, animatingDifferences: animatingDifferences)
    }
}
