//
//  OrderListView.swift
//  CoffeeOrdering
//
//  Created by Luís Filipe Nascimento on 27/12/22.
//

import SwiftUI

struct OrderListView: View {

    let orders: [OrderViewModel]

    var body: some View {
        List {
            ForEach(orders) { order in
                HStack {
                    Image(order.coffeeName)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(16)

                    VStack(alignment: .leading) {
                        Text(order.name)
                            .font(.title)
                            .padding([.leading, .bottom], 10)

                        HStack {
                            Text(order.coffeeName)
                                .padding(10)
                                .background(Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(10)

                            Text(order.size)
                                .padding(10)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                }
            }
        }
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        OrderListView(orders: [
            OrderViewModel(order: Order(
                name: "Mary",
                size: "Medium",
                coffeeName: "Regular",
                total: 3
            ))
        ])
    }
}
