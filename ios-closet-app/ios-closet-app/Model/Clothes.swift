//
//  Clothes.swift
//  ios-closet-app
//
//  Created by Bora Yang on 2023/05/25.
//

import UIKit

struct Clothes: Hashable {
    var id = UUID()
    let imageUrl: String
    var category: Category
    var tag: [String]

    init(imageUrl: String, category: Category, tag: [String]) {
        self.imageUrl = imageUrl
        self.category = category
        self.tag = tag
    }

    func hash(into hasher: inout Hasher) {
      hasher.combine(id)
    }

    static func == (lhs: Clothes, rhs: Clothes) -> Bool {
      lhs.id == rhs.id
    }
}

enum Category {
    case top
    case pants
    case shoes
    case accessory
    case overcoat
}
