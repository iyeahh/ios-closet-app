//
//  Section.swift
//  ios-closet-app
//
//  Created by Bora Yang on 2023/05/30.
//

import Foundation
import UIKit

class Section: Hashable {
  var id = UUID()
  var title: String
  var clothes: [Clothes]

  init(title: String, clothes: [Clothes]) {
    self.title = title
    self.clothes = clothes
  }

  func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }

  static func == (lhs: Section, rhs: Section) -> Bool {
    lhs.id == rhs.id
  }
}

extension Section {
  static var allSections: [Section] = [
    Section(title: "상의", clothes: [
        Clothes(imageUrl: "https://assets.burberry.com/is/image/Burberryltd/DAE977F2-E43C-4931-B200-547E02C0DE89?$BBY_V2_SL_1x1$&wid=200&hei=200", category: .top, tag: ["후드티"]),
        Clothes(imageUrl: "https://assets.burberry.com/is/image/Burberryltd/B6235150-2B92-4C8B-AF80-2708891A87D1?$BBY_V2_SL_1x1$&wid=200&hei=200", category: .top, tag: ["반팔티"]),
        Clothes(imageUrl: "https://balenciaga.dam.kering.com/m/a5a5822ec26a26d/Large-723122TNVA68482_F.jpg?v=4", category: .top, tag: ["반팔티"])
    ]),
    Section(title: "하의", clothes: [
        Clothes(imageUrl: "https://assets.burberry.com/is/image/Burberryltd/4CE61AC6-7A45-46CF-8C81-E34151F4EA9D?$BBY_V2_SL_1x1$&wid=200&hei=200", category: .pants, tag: ["청바지"]),
        Clothes(imageUrl: "https://assets.burberry.com/is/image/Burberryltd/65EBB4EC-43C4-418F-BBAF-62C5F46563D8?$BBY_V2_SL_1x1$&wid=200&hei=200", category: .pants, tag: ["반바지"]),
        Clothes(imageUrl: "https://assets.burberry.com/is/image/Burberryltd/6D1F4C30-BC68-4156-86A3-602F59883A06?$BBY_V2_SL_1x1$&wid=200&hei=200", category: .pants, tag: ["반바지"]),
        Clothes(imageUrl: "https://balenciaga.dam.kering.com/m/4ade8def657cd9c8/eCom-723824TNVN28482_F.jpg?v=1", category: .pants, tag: ["트레이닝바지"])
    ]),
    Section(title: "신발", clothes: [
        Clothes(imageUrl: "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/4507b3ba-1051-467d-b14e-b9325c4bc21f/%EB%8D%A9%ED%81%AC-%EB%A1%9C%EC%9A%B0-%EB%A0%88%ED%8A%B8%EB%A1%9C-%ED%94%84%EB%A6%AC%EB%AF%B8%EC%97%84-%EB%82%A8%EC%84%B1-%EC%8B%A0%EB%B0%9C-HnNfCXGn.png", category: .shoes, tag: ["운동화"]),
        Clothes(imageUrl: "https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/60e98509-bbe4-4edf-a1cc-77567773fcef/%EB%8D%A9%ED%81%AC-%EB%A1%9C%EC%9A%B0-%EB%A0%88%ED%8A%B8%EB%A1%9C-%ED%94%84%EB%A6%AC%EB%AF%B8%EC%97%84-%EB%82%A8%EC%84%B1-%EC%8B%A0%EB%B0%9C-p3eVdXYe.png", category: .shoes, tag: ["운동화"])
    ]),
    Section(title: "악세사리", clothes: [
        Clothes(imageUrl: "https://wwws.dior.com/couture/ecommerce/media/catalog/product/cache/1/zoom_image_1/3000x2000/17f82f742ffe127f42dca9de82fb58b1/t/S/1645731911_B1133PMTCY_D301_E01_ZH.jpg", category: .accessory, tag: ["팔찌"]),
        Clothes(imageUrl: "https://wwws.dior.com/couture/ecommerce/media/catalog/product/cache/1/zoom_image_1/3000x2000/17f82f742ffe127f42dca9de82fb58b1/n/l/1666372388_B1720HOMMT_D000_E01_ZH.jpg", category: .accessory, tag: ["팔찌"]),
        Clothes(imageUrl: "https://assets.burberry.com/is/image/Burberryltd/6C06032A-820C-48DB-94AF-3873B2FA4B65?$BBY_V2_SL_1x1$&wid=200&hei=200", category: .accessory, tag: ["목걸이"])
    ]),
    Section(title: "외투", clothes: [
        Clothes(imageUrl: "https://images.descentekorea.co.kr/product/U/N1/UN121SJK21/620/UN121SJK21_GBR0_N01.JPG", category: .overcoat, tag: ["바람막이"]),
        Clothes(imageUrl: "https://cdn.jentestore.io/resource/products/872681/872681_1.jpg?_=40133670", category: .overcoat, tag: ["자켓"])
    ])
  ]
}

extension Section {
  static var styleSection: [Section] = [
    Section(title: "상의", clothes: [
        Clothes(imageUrl: "https://assets.burberry.com/is/image/Burberryltd/DAE977F2-E43C-4931-B200-547E02C0DE89?$BBY_V2_SL_1x1$&wid=200&hei=200", category: .top, tag: ["후드티"]),
        Clothes(imageUrl: "https://balenciaga.dam.kering.com/m/4ade8def657cd9c8/eCom-723824TNVN28482_F.jpg?v=1", category: .pants, tag: ["트레이닝바지"]),
        Clothes(imageUrl: "https://images.descentekorea.co.kr/product/U/N1/UN121SJK21/620/UN121SJK21_GBR0_N01.JPG", category: .overcoat, tag: ["바람막이"]),
        Clothes(imageUrl: "https://assets.burberry.com/is/image/Burberryltd/6C06032A-820C-48DB-94AF-3873B2FA4B65?$BBY_V2_SL_1x1$&wid=200&hei=200", category: .accessory, tag: ["목걸이"])
    ])
  ]
}

extension Section {
  static var homeSection: [Section] = [
    Section(title: "상의", clothes: [
        Clothes(imageUrl: "https://assets.burberry.com/is/image/Burberryltd/DAE977F2-E43C-4931-B200-547E02C0DE89?$BBY_V2_SL_1x1$&wid=200&hei=200", category: .top, tag: ["후드티"]),
        Clothes(imageUrl: "https://balenciaga.dam.kering.com/m/4ade8def657cd9c8/eCom-723824TNVN28482_F.jpg?v=1", category: .pants, tag: ["트레이닝바지"])
    ])
  ]
}
