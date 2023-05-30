//
//  SectionHeaderReusableView.swift
//  ios-closet-app
//
//  Created by Bora Yang on 2023/05/29.
//

import Foundation
import UIKit

class SectionHeaderReusableView: UICollectionReusableView {
  static var reuseIdentifier: String {
    return String(describing: SectionHeaderReusableView.self)
  }

  lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(
      ofSize: UIFont.preferredFont(forTextStyle: .title3).pointSize,
      weight: .bold)
    label.adjustsFontForContentSizeCategory = true
    label.textColor = .label
    label.textAlignment = .left
    label.numberOfLines = 1
    label.setContentCompressionResistancePriority(
      .defaultHigh, for: .horizontal)
    return label
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
      backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
    addSubview(titleLabel)
    if UIDevice.current.userInterfaceIdiom == .pad {
      NSLayoutConstraint.activate([
        titleLabel.leadingAnchor.constraint(
          equalTo: leadingAnchor,
          constant: 5),
        titleLabel.trailingAnchor.constraint(
          lessThanOrEqualTo: trailingAnchor,
          constant: -5)])
    } else {
      NSLayoutConstraint.activate([
        titleLabel.leadingAnchor.constraint(
          equalTo: readableContentGuide.leadingAnchor),
        titleLabel.trailingAnchor.constraint(
          lessThanOrEqualTo: readableContentGuide.trailingAnchor)
      ])
    }
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(
        equalTo: topAnchor,
        constant: 10),
      titleLabel.bottomAnchor.constraint(
        equalTo: bottomAnchor,
        constant: -10)
    ])
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
