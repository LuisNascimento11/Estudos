//
//  AddCoffeeViewModel.swift
//  CoffeeOrdering
//
//  Created by Luís Filipe Nascimento on 02/01/23.
//

import Foundation

class AddCoffeeOrderViewModel: ObservableObject {

    var name: String = ""
    @Published var size: String = "Medium"
    @Published var coffeeName: String = ""

    var coffeeList: [CoffeeViewModel] {
        return Coffee.all().map(CoffeeViewModel.init)
    }

    private var webService: WebService

    init(webService: WebService) {
        self.webService = webService
    }

    var total: Double {
        return calculateTotalPrice()
    }

    func placeOrder() {
        let order = Order(
            name: self.name,
            size: self.size,
            coffeeName: self.coffeeName,
            total: self.total
        )

        self.webService.createCoffeeOrder(order: order) { _ in
            
        }
    }

    private func priceForSize() -> Double {
        let prices: [String : Double] = [
            "Small": 2.0,
            "Medium": 3.0,
            "Large": 4.0
        ]

        return prices[self.size]!
    }

    private func calculateTotalPrice() -> Double {
        let coffeVM = coffeeList.first(where: {$0.name == coffeeName})

        if let coffeVM {
            return coffeVM.price * priceForSize()
        }

        return 0.0
    }

}
