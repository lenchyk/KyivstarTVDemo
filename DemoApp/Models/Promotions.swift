//
//  Promotions.swift
//  DemoApp
//
//  Created by Lena Soroka on 21.11.2024.
//

struct Promotions: Decodable {
    let id: String
    let name: String
    let promotions: [Promotion]?
}

extension Promotions {
    static var fakeItem: Self {
        .init(
            id: "slaflgfjwg",
            name: "Fake Promotions",
            promotions: [.fakeItem]
        )
    }
}
