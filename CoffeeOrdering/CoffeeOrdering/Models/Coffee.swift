//
//  Coffee.swift
//  CoffeeOrdering
//
//  Created by Luís Filipe Nascimento on 27/12/22.
//

import Foundation

struct Coffee: Codable {
    let name: String
    let imageURL: String
    let price: Double
}

#if DEBUG
extension Coffee {
    static func all() -> [Coffee] {
        return [
            Coffee(name: "Cappuccino", imageURL: "Cappuccino", price: 2.5),
            Coffee(name: "Expresso", imageURL: "Expresso", price: 2.1),
            Coffee(name: "Regular", imageURL: "Regular", price: 1.0)
        ]
    }
}
#endif
