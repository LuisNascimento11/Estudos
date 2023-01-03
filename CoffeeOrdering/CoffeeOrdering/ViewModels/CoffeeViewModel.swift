//
//  CoffeeViewModel.swift
//  CoffeeOrdering
//
//  Created by Luís Filipe Nascimento on 02/01/23.
//

import Foundation

class CoffeeListViewModel {
    var coffeeList: [CoffeeViewModel] = []
}

class CoffeeViewModel {

    var coffee: Coffee

    init(coffee: Coffee) {
        self.coffee = coffee
    }

    var name: String {
        return self.coffee.name
    }

    var imageURL: String {
        return self.coffee.imageURL
    }

    var price: Double {
        return self.coffee.price
    }
}
