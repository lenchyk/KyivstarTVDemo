//
//  ContentGroup.swift
//  DemoApp
//
//  Created by Lena Soroka on 21.11.2024.
//

struct ContentGroup: Decodable {
    let id: String
    let name: String
    let type: [String]
    let assets: [Asset]
}

extension ContentGroup {
    static var fakeItem: Self {
        .init(
            id: "csdlfjf",
            name: "Fake content group",
            type: ["Movie"],
            assets: [.fakeItem]
        )
    }
}
