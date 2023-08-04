//
//  ProductService.swift
//  Demo
//
//  Created by Achraf Trabelsi on 03/08/2023.
//

import Foundation
import Erizou

protocol ProductServiceProviding {
    func fetchProducts() async throws -> ProductsResponse?
}

struct ProductService: HTTPClient, ProductServiceProviding {
    func fetchProducts() async throws -> ProductsResponse? {
        try await sendRequest(endpoint: ProductEndpoint.fetchProducts, responseModel: ProductsResponse.self)
    }
}

// MARK: - ProductsResponse

struct ProductsResponse: Codable {
    struct Product: Codable {
        let id: Int
        let title: String
        let description: String
        let price: Double
        let discountPercentage: Double
        let rating: Float
        let stock: Double
        let brand: String
        let category: String
        let thumbnail: String
    }

    let products: [Product]
}
