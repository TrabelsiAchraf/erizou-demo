//
//  ContentView.swift
//  Demo
//
//  Created by Achraf Trabelsi on 31/07/2023.
//

import SwiftUI

struct ProductsView: View {

    @State private var products: [Product] = []
    private let viewModel: ProductViewModelProviding

    init(viewModel: ProductViewModelProviding) {
        self.viewModel = viewModel
    }

    var body: some View {
        List(products, id: \.id) { product in
            ProductView(product: product)
        }
        .task {
            products = await viewModel.fetchProducts() ?? []
        }
    }
}

// MARK: - ProductView

struct ProductView: View {
    let product: Product
    var body: some View {
        AsyncImage(url: product.thumbnail)
        VStack(alignment: .leading) {
            Text(product.title)
            Text(product.price)
        }
    }
}

// MARK: - ContentView_Previews

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView(viewModel: MockProductViewModel())
    }
}
