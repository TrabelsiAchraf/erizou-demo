//
//  Product.swift
//  Demo
//
//  Created by Achraf Trabelsi on 04/08/2023.
//

import Foundation

struct Product: Identifiable {
    let id: Int
    var title: String
    let price: String
    let thumbnail: URL?
}
