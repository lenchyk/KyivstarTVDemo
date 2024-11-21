//
//  Asset.swift
//  DemoApp
//
//  Created by Lena Soroka on 21.11.2024.
//

struct Asset: Decodable {
    let id: String
    let name: String
    let image: String
    let company: String
    let progress: Int
    let purchased: Bool
    let sortIndex: Int
    let updatedAt: String // TODO: - time stamp
    let releaseDate: String // TODO: - time stamp
}

extension Asset {
    static var fakeItem: Self {
        .init(
            id: "Fsdsfjwo",
            name: "Fake Asset",
            image: "https://picsum.photos/id/761/400/600",
            company: "Brothers Pictures",
            progress: 50,
            purchased: false,
            sortIndex: 0,
            updatedAt: "2013-04-26T02:47:43.037Z",
            releaseDate: "1991-01-06"
        )
    }
}
