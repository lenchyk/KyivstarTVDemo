//
//  Promotion.swift
//  DemoApp
//
//  Created by Lena Soroka on 21.11.2024.
//

struct Promotion: Decodable {
    let id: String
    let name: String
    let image: String
    let company: String
    let updatedAt: String // "2013-04-26T02:47:43.037Z"
    let releasedDate: String? // "1991-01-06"
}

extension Promotion {
    static var fakeItem: Self {
        .init(
            id: "sldjljfjf",
            name: "Fake promotion",
            image: "",
            company: "Company name",
            updatedAt: "2013-04-26T02:47:43.037Z",
            releasedDate: "1991-01-06"
        )
    }
}
