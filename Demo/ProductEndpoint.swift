//
//  ProductEnfpoint.swift
//  Demo
//
//  Created by Achraf Trabelsi on 03/08/2023.
//

import Foundation
import Erizou

enum ProductEndpoint {
    case fetchProducts
}

extension ProductEndpoint: Endpoint {
    var scheme: String {
        "https"
    }

    var host: String {
        "dummyjson.com"
    }

    var path: String {
        "/products"
    }

    var subPath: String? {
        nil
    }

    var method: Erizou.RequestMethod {
        .get
    }

    var header: [String : String]? {
        nil
    }

    var token: String? {
        nil
    }

    var body: [String : String]? {
        nil
    }

    var queryItems: [(name: String, value: String)]? {
        nil
    }
}
