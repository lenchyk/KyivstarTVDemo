//
//  Category.swift
//  DemoApp
//
//  Created by Lena Soroka on 20.11.2024.
//

struct Category: Decodable {
    let id: String
    let name: String
    let image: String
}

extension Category {
    static var fakeItem: Self {
        .init(
            id: "slfwlgfjwg",
            name: "Fake Category",
            image: "Category"
        )
    }
}
