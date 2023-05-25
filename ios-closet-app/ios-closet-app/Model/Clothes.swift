//
//  Clothes.swift
//  ios-closet-app
//
//  Created by Bora Yang on 2023/05/25.
//

import Foundation

struct Clothes {
    let imageUrl: String
    let category: Category

    init(image: String, category: Category) {
        self.imageUrl = image
        self.category = category
    }
}

enum Category {
    case top
    case pants
    case shoes
    case accessory
    case overcoat
}


