//
//  ClothesViewController.swift
//  ios-closet-app
//
//  Created by Bora Yang on 2023/05/24.
//

import UIKit

class ClothesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
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
}

