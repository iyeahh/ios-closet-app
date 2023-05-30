//
//  DetailCollectionViewCell.swift
//  ios-closet-app
//
//  Created by Bora Yang on 2023/05/30.
//

import Foundation
import UIKit
import Kingfisher

class DetailCollectionViewCell: UICollectionViewCell {

    static var reuseIdentifier: String {
      return String(describing: DetailCollectionViewCell.self)
    }

    var width = CGFloat(100)
    private let image = UIImageView()
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

    func configureUI(imageUrl: String, text: String) {
        image.kf.setImage(with: URL(string: imageUrl))
        informationLabel.text = text
    }

    private func setUI() {
        contentView.backgroundColor = .white
        contentView.addSubview(image)
        contentView.addSubview(line)
        contentView.addSubview(informationLabel)

        image.translatesAutoresizingMaskIntoConstraints = false
        line.translatesAutoresizingMaskIntoConstraints = false
        informationLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            image.widthAnchor.constraint(equalToConstant: width * 3),
            image.heightAnchor.constraint(equalToConstant: width * 2),
            image.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),

            line.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            line.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            line.topAnchor.constraint(equalTo: image.bottomAnchor),
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
