//
//  PromotionsAPIClient.swift
//  DemoApp
//
//  Created by Lena Soroka on 21.11.2024.
//

import Foundation
import Combine

class PromotionsAPIClient {
    private let urlString = "https://api.json-generator.com/templates/j_BRMrbcY-5W/data"
    
    func getPromotions() -> AnyPublisher<Promotions, Never> {
        guard let url = URL(string: urlString) else {
            return Just(Promotions.fakeItem)
                .eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.GET.rawValue
        request.setValue("Bearer \(Constants.beaurerToken)", forHTTPHeaderField: "Authorization")
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: Promotions.self, decoder: JSONDecoder())
            .catch { error in return Just(Promotions.fakeItem) }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
