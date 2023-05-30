//
//  HomeViewController.swift
//  ios-closet-app
//
//  Created by Bora Yang on 2023/05/24.
//

import UIKit

class HomeViewController: UIViewController {
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
    private var dataSource: UICollectionViewDiffableDataSource<Section,Clothes>?
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Clothes>
    private var sections = Section.homeSection

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        setUI()
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.reuseIdentifier)
        collectionView.register(DetailCollectionViewCell.self, forCellWithReuseIdentifier: DetailCollectionViewCell.reuseIdentifier)
        collectionView.setCollectionViewLayout(createLayout(), animated: true)
        setDataSource()
        applySnapshot()
    }

    private func setUI() {
        view.backgroundColor = .lightGray

        let titleLabel = UILabel()
        titleLabel.textColor = .black
        titleLabel.text = "MY CLOSET"
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLabel)

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white

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

            switch sectionIndex {
            case 0:
                return self?.createSixClothesSection()
            default:
                return self?.createClothesSection()
            }
        }, configuration: config)
    }

    private func createSixClothesSection() -> NSCollectionLayoutSection {
        // item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0)
        // group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(250))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        // section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20)
        return section
    }

    private func createClothesSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.7), heightDimension: .absolute(250))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20)
        return section
    }

    private func setDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section,Clothes>(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in

            switch indexPath.row {
            case 0:
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: HomeCollectionViewCell.reuseIdentifier,
                    for: indexPath) as? HomeCollectionViewCell
                cell?.configureUI(image1Url: "https://assets.burberry.com/is/image/Burberryltd/DAE977F2-E43C-4931-B200-547E02C0DE89?$BBY_V2_SL_1x1$&wid=200&hei=200", image2Url: "https://balenciaga.dam.kering.com/m/a5a5822ec26a26d/Large-723122TNVA68482_F.jpg?v=4", image3Url: "https://assets.burberry.com/is/image/Burberryltd/65EBB4EC-43C4-418F-BBAF-62C5F46563D8?$BBY_V2_SL_1x1$&wid=200&hei=200", image4Url: "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/60e98509-bbe4-4edf-a1cc-77567773fcef/%EB%8D%A9%ED%81%AC-%EB%A1%9C%EC%9A%B0-%EB%A0%88%ED%8A%B8%EB%A1%9C-%ED%94%84%EB%A6%AC%EB%AF%B8%EC%97%84-%EB%82%A8%EC%84%B1-%EC%8B%A0%EB%B0%9C-p3eVdXYe.png", image5Url: "https://wwws.dior.com/couture/ecommerce/media/catalog/product/cache/1/zoom_image_1/3000x2000/17f82f742ffe127f42dca9de82fb58b1/n/l/1666372388_B1720HOMMT_D000_E01_ZH.jpg", image6Url: "https://cdn.jentestore.io/resource/products/872681/872681_1.jpg?_=40133670", text: "데이트룩")
                return cell
            default:
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: DetailCollectionViewCell.reuseIdentifier,
                    for: indexPath) as? DetailCollectionViewCell
                cell?.configureUI(imageUrl: "https://balenciaga.dam.kering.com/m/a5a5822ec26a26d/Large-723122TNVA68482_F.jpg?v=4", text: "아디다스")
                return cell
            }
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
