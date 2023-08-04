//
//  DemoApp.swift
//  Demo
//
//  Created by Achraf Trabelsi on 31/07/2023.
//

import SwiftUI
import Erizou

@main
struct DemoApp: App {
    var body: some Scene {
        WindowGroup {
            ProductsView(viewModel: ProductViewModel(service: ProductService()))
        }
    }
}
