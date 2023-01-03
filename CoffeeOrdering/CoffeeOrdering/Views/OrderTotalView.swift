//
//  OrderTotalView.swift
//  CoffeeOrdering
//
//  Created by Luís Filipe Nascimento on 02/01/23.
//

import SwiftUI

struct OrderTotalView: View {

    let total: Double

    var body: some View {
        HStack(alignment: .center) {
            Spacer()

            Text(String(format: "$%.2f", self.total))
                .font(.title)
                .foregroundColor(.green)

            Spacer()
        }.padding(10)
    }
}

struct OrderTotalView_Previews: PreviewProvider {
    static var previews: some View {
        OrderTotalView(total: 45.67)
    }
}
