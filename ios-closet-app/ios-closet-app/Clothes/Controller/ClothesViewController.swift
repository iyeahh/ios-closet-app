//
//  ClothesViewController.swift
//  ios-closet-app
//
//  Created by Bora Yang on 2023/05/24.
//

import UIKit
import PhotosUI
import Photos


class ClothesViewController: UIViewController {
    private var sections = Section.allSections
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
    private lazy var dataSource = makeDataSource()

    var imageURLs: [URL] = []

    // MARK: - Value Types
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Clothes>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Clothes>

    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        setLayout()
        setUI()
        registerCollectionViewCell()
        configureLayout()
        applySnapshot(animatingDifferences: false)
        collectionView.delegate = self
    }

    private func registerCollectionViewCell() {
        collectionView.register(ClothesCollectionViewCell.self, forCellWithReuseIdentifier: ClothesCollectionViewCell.reuseIdentifier)
        collectionView.register(FirstCollectionViewCell.self, forCellWithReuseIdentifier: FirstCollectionViewCell.reuseIdentifier)
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

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }

    private func setLayout() {
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    // MARK: - Functions
    func makeDataSource() -> DataSource {
        let dataSource = DataSource(
            collectionView: collectionView,
            cellProvider: { (collectionView, indexPath, clothes) ->
                UICollectionViewCell? in

                switch indexPath.row {
                case 0:
                    let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: FirstCollectionViewCell.reuseIdentifier,
                        for: indexPath) as? FirstCollectionViewCell
                    return cell
                default:
                    let cell = collectionView.dequeueReusableCell(
                        withReuseIdentifier: ClothesCollectionViewCell.reuseIdentifier,
                        for: indexPath) as? ClothesCollectionViewCell
                    cell?.clothes = clothes
                    return cell
                }
            })
        
        dataSource.supplementaryViewProvider = { collectionView, kind, indexPath in
            guard kind == UICollectionView.elementKindSectionHeader else {
                return nil
            }
            let section = self.dataSource.snapshot()
                .sectionIdentifiers[indexPath.section]
            let view = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: SectionHeaderReusableView.reuseIdentifier,
                for: indexPath) as? SectionHeaderReusableView
            view?.titleLabel.text = section.title
            return view
        }
        return dataSource
    }

    func applySnapshot(animatingDifferences: Bool = true) {
        var snapshot = Snapshot()
        snapshot.appendSections(sections)
        sections.forEach { section in
            snapshot.appendItems(section.clothes, toSection: section)
        }
        dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
    }
}

// MARK: - Layout Handling
extension ClothesViewController {
    private func configureLayout() {
        collectionView.register(
            SectionHeaderReusableView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: SectionHeaderReusableView.reuseIdentifier
        )
        collectionView.collectionViewLayout = UICollectionViewCompositionalLayout(sectionProvider: { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            let isPhone = layoutEnvironment.traitCollection.userInterfaceIdiom == UIUserInterfaceIdiom.phone

            let size = NSCollectionLayoutSize(
                widthDimension: NSCollectionLayoutDimension.fractionalWidth(0.3),
                heightDimension: NSCollectionLayoutDimension.absolute(isPhone ? 120 : 100)
            )

            let itemCount = isPhone ? 1 : 3
            let item = NSCollectionLayoutItem(layoutSize: size)
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, subitem: item, count: itemCount)
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
            section.interGroupSpacing = 10
            // Supplementary header view setup
            let headerFooterSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(20)
            )
            let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: headerFooterSize,
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top
            )
            section.boundarySupplementaryItems = [sectionHeader]
            section.orthogonalScrollingBehavior = .paging
            return section
        })
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { context in
            self.collectionView.collectionViewLayout.invalidateLayout()
        }, completion: nil)
    }
}

extension ClothesViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let currentCellIndexPath = collectionView.indexPathsForVisibleItems.first else {
            return CGSize(width: 100.0, height: 100.0)
        }

        let cellWidth: CGFloat = currentCellIndexPath == indexPath ? 200.0 : 100.0
        let cellHeight: CGFloat = currentCellIndexPath == indexPath ? 200.0 : 100.0

        return CGSize(width: cellWidth, height: cellHeight)
    }
}

extension ClothesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard indexPath.row == 0 else { return }
        setupImagePicker()
    }

    func setupImagePicker() {
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 0
        configuration.filter = .any(of: [.images, .videos])

        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }
}

extension ClothesViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)

        let itemProvider = results.first?.itemProvider

        if let itemProvider = itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                DispatchQueue.main.async {
                    self.getSavedImageURLs { url in
                        let clothes = Clothes(imageUrl: url.absoluteString, category: .top, tag: ["랜덤"])
                        dump(clothes)
                    }
                    // 이미지뷰에 표시
//                    self.detailView.mainImageView.image = image as? UIImage
//                    if let imageUrl = Bundle.main.url(forResource: "imageName", withExtension: "jpg") {
//                        // 이미지 파일의 URL을 사용하여 작업 수행
//                        print(imageUrl.absoluteString)
//                    }
//                    Clothes(imageUrl: <#T##String#>, category: .top, tag: ["랜덤"])
                }
            }
        } else {
            print("이미지 못 불러왔음!!!!")
        }
    }
}

extension ClothesViewController {
    func getSavedImageURLs(completion: @escaping (URL) -> Void) {
        let fetchOptions = PHFetchOptions()
        fetchOptions.predicate = NSPredicate(format: "mediaType = %d", PHAssetMediaType.image.rawValue)
        let fetchResult: PHFetchResult = PHAsset.fetchAssets(with: fetchOptions)

        fetchResult.enumerateObjects { asset, _, _ in
            if asset.mediaType == .image {
                let options = PHImageRequestOptions()
                options.isSynchronous = true

                PHImageManager.default().requestImageData(for: asset, options: options) { imageData, _, _, _ in
                    if let imageData = imageData, let imageURL = self.saveImageDataToTemporaryDirectory(imageData) {
                        completion(imageURL)
                    }
                }
            }
        }

        // imageURLs 배열에 저장된 이미지 URL들을 사용하거나 반환합니다.
    }

    func saveImageDataToTemporaryDirectory(_ imageData: Data) -> URL? {
        let tempDirectoryURL = FileManager.default.temporaryDirectory
        let uniqueFilename = ProcessInfo.processInfo.globallyUniqueString
        let fileURL = tempDirectoryURL.appendingPathComponent(uniqueFilename)

        do {
            try imageData.write(to: fileURL)
            return fileURL
        } catch {
            print("Failed to save image data to temporary directory: \(error.localizedDescription)")
            return nil
        }
    }
}