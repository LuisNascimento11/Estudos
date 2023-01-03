//
//  Order.swift
//  CoffeeOrdering
//
//  Created by Luís Filipe Nascimento on 27/12/22.
//

import Foundation

struct Order: Codable {
    let name: String
    let size: String
    let coffeeName: String
    let total: Double
}
