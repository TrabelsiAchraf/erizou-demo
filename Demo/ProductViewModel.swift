//
//  ProductViewModel.swift
//  Demo
//
//  Created by Achraf Trabelsi on 03/08/2023.
//

import Foundation

protocol ProductViewModelProviding {
    func fetchProducts() async -> [Product]?
}

struct ProductViewModel: ProductViewModelProviding {

    let service: ProductServiceProviding

    init(service: ProductServiceProviding) {
        self.service = service
    }

    func fetchProducts() async -> [Product]? {
        do {
            let domainProducts = try await service.fetchProducts()
            return domainProducts?.products.map {
                Product(
                    id: $0.id,
                    title: "\($0.title)",
                    price: "\($0.price) $",
                    thumbnail: URL(string: $0.thumbnail)
                )
            }
        } catch {
            return nil
        }
    }
}

// MARK: - MockProductViewModel

struct MockProductViewModel: ProductViewModelProviding {
    func fetchProducts() async -> [Product]? {
        [
            Product(
                id: 0,
                title: "Product: iPhone 9",
                price: "Price: 549 $",
                thumbnail: URL(string: "https://i.dummyjson.com/data/products/1/thumbnail.jpg")
            )
        ]
    }
}
