//
//  HomeCollectionViewCell.swift
//  ios-closet-app
//
//  Created by Bora Yang on 2023/05/30.
//

import Foundation
import UIKit
import Kingfisher

class HomeCollectionViewCell: UICollectionViewCell {

    static var reuseIdentifier: String {
      return String(describing: HomeCollectionViewCell.self)
    }

    var width = CGFloat(100)
    private let image1 = UIImageView()
    private let image2 = UIImageView()
    private let image3 = UIImageView()
    private let image4 = UIImageView()
    private let image5 = UIImageView()
    private let image6 = UIImageView()
    private let line: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        return view
    }()
    private let informationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureUI(image1Url: String, image2Url: String, image3Url: String, image4Url: String, image5Url: String, image6Url: String, text: String) {
        image1.kf.setImage(with: URL(string: image1Url))
        image2.kf.setImage(with: URL(string: image2Url))
        image3.kf.setImage(with: URL(string: image3Url))
        image4.kf.setImage(with: URL(string: image4Url))
        image5.kf.setImage(with: URL(string: image5Url))
        image6.kf.setImage(with: URL(string: image6Url))
        informationLabel.text = text
    }

    private func setUI() {
        contentView.backgroundColor = .white
        contentView.addSubview(image1)
        contentView.addSubview(image2)
        contentView.addSubview(image3)
        contentView.addSubview(image4)
        contentView.addSubview(image5)
        contentView.addSubview(image6)
        contentView.addSubview(line)
        contentView.addSubview(informationLabel)

        image1.translatesAutoresizingMaskIntoConstraints = false
        image2.translatesAutoresizingMaskIntoConstraints = false
        image3.translatesAutoresizingMaskIntoConstraints = false
        image4.translatesAutoresizingMaskIntoConstraints = false
        image5.translatesAutoresizingMaskIntoConstraints = false
        image6.translatesAutoresizingMaskIntoConstraints = false
        line.translatesAutoresizingMaskIntoConstraints = false
        informationLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            image1.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            image1.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            image1.widthAnchor.constraint(equalToConstant: width),
            image1.heightAnchor.constraint(equalToConstant: width),

            image2.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            image2.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            image2.widthAnchor.constraint(equalToConstant: width),
            image2.heightAnchor.constraint(equalToConstant: width),

            image3.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            image3.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            image3.widthAnchor.constraint(equalToConstant: width),
            image3.heightAnchor.constraint(equalToConstant: width),

            image4.topAnchor.constraint(equalTo: image1.bottomAnchor),
            image4.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            image4.widthAnchor.constraint(equalToConstant: width),
            image4.heightAnchor.constraint(equalToConstant: width),

            image5.topAnchor.constraint(equalTo: image2.bottomAnchor),
            image5.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            image5.widthAnchor.constraint(equalToConstant: width),
            image5.heightAnchor.constraint(equalToConstant: width),

            image6.topAnchor.constraint(equalTo: image3.bottomAnchor),
            image6.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            image6.widthAnchor.constraint(equalToConstant: width),
            image6.heightAnchor.constraint(equalToConstant: width),

            line.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            line.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            line.topAnchor.constraint(equalTo: image6.bottomAnchor),
            line.heightAnchor.constraint(equalToConstant: 1),

            informationLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            informationLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            informationLabel.topAnchor.constraint(equalTo: line.bottomAnchor, constant: 10)
        ])

        self.cornerRadius = 10
        self.clipsToBounds = true
        self.shadowOpacity = 1
        self.shadowOffset = CGSize(width: 1, height: 1)
        self.shadowRadius = 10
    }
}
