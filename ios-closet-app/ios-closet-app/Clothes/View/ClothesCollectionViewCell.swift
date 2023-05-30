//
//  ClothesCollectionViewCell.swift
//  ios-closet-app
//
//  Created by Bora Yang on 2023/05/29.
//

import Foundation
import UIKit
import Kingfisher

class ClothesCollectionViewCell: UICollectionViewCell {

    static var reuseIdentifier: String {
      return String(describing: ClothesCollectionViewCell.self)
    }
    
    private let mainImage = UIImageView()
    private let tagLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .gray
        return label
    }()

    var clothes: Clothes? {
        didSet {
            configureUI()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureUI() {
        mainImage.kf.setImage(with: URL(string: clothes?.imageUrl ?? ""))
        tagLabel.text = "#" + (clothes?.tag[0] ?? "")
    }

    private func setUI() {
        contentView.backgroundColor = .white
        contentView.addSubview(mainImage)
        contentView.addSubview(tagLabel)

        mainImage.translatesAutoresizingMaskIntoConstraints = false
        tagLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            mainImage.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            mainImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            mainImage.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            mainImage.heightAnchor.constraint(equalToConstant: 80),

            tagLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            tagLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            tagLabel.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 8)
        ])

        self.cornerRadius = 10
        self.clipsToBounds = true
        self.shadowOpacity = 1
        self.shadowOffset = CGSize(width: 1, height: 1)
        self.shadowRadius = 10
    }
}

