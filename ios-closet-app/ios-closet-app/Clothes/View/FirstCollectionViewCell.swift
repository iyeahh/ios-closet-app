//
//  FirstCollectionViewCell.swift
//  ios-closet-app
//
//  Created by Bora Yang on 2023/05/29.
//

import Foundation
import UIKit
import Kingfisher

class FirstCollectionViewCell: UICollectionViewCell {

    static var reuseIdentifier: String {
      return String(describing: FirstCollectionViewCell.self)
    }

    private let mainImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "camera.fill")
        imageView.tintColor = .lightGray
        return imageView
    }()

    private let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .gray
        label.textAlignment = .center
        label.text = "옷 추가"
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUI() {
        contentView.backgroundColor = .white
        contentView.addSubview(mainImage)
        contentView.addSubview(label)

        mainImage.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            mainImage.heightAnchor.constraint(equalToConstant: 20),
            mainImage.widthAnchor.constraint(equalToConstant: 20),
            mainImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            mainImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -8),

            label.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            label.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 3)
        ])

        self.cornerRadius = 10
        self.clipsToBounds = true
        self.shadowOpacity = 1
        self.shadowOffset = CGSize(width: 1, height: 1)
        self.shadowRadius = 10
    }
}

