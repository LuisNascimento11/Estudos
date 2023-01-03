//
//  OrderListViewModel.swift
//  CoffeeOrdering
//
//  Created by Luís Filipe Nascimento on 27/12/22.
//

import Foundation

class OrderListViewModel: ObservableObject {

    @Published var orders = [OrderViewModel]()

    func fetchOrders() {
        WebService.shared.getAllOrders { orders in
            if let orders {
                self.orders = orders.map(OrderViewModel.init)
            }
        }
    }

}

class OrderViewModel: Identifiable {

    let id = UUID()
    let order: Order

    init(order: Order) {
        self.order = order
    }

    var name: String {
        return self.order.name
    }

    var size: String {
        return self.order.size
    }

    var coffeeName: String {
        return self.order.coffeeName
    }

    var total: Double {
        return self.order.total
    }
}
