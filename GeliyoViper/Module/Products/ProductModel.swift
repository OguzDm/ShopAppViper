//
//  ProductModel.swift
//  Geliyo
//
//  Created by Oguz Demırhan on 31.07.2021.
//

import Foundation

struct ProductModel: Codable {
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
}

typealias ProductModels = [ProductModel]
