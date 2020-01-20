//
//  Product.swift
//  WalmartLabsTest
//
//  Created by Bethany Wride on 1/20/20.
//  Copyright © 2020 Bethany Bellio. All rights reserved.
//

import Foundation

struct DataResults: Decodable {
    let products: [Product]
}

struct Product: Decodable {
    let productName: String
    let productId: String
    let inStock: Bool
    let shortDescription: String
    let longDescription: String
    let price: String
    let reviewCount: Int
    let reviewRating: Int
    let productImage: String
}
