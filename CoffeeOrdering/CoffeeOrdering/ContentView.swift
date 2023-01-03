//
//  ContentView.swift
//  CoffeeOrdering
//
//  Created by Luís Filipe Nascimento on 27/12/22.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject private var viewModel = OrderListViewModel()
    @State private var showModal: Bool = false

    var body: some View {

        NavigationView {
            OrderListView(orders: viewModel.orders)
            .navigationTitle("Coffee Orders")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        self.viewModel.fetchOrders()
                    } label: {
                        Image(systemName: "arrow.clockwise")
                    }
                }

                ToolbarItem {
                    Button {
                        self.showModal = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }

            .sheet(isPresented: $showModal, onDismiss: {
                viewModel.fetchOrders()
            }) {
                AddCoffeeOrderView(isPresented: $showModal)
            }

        }
        .onAppear {
            viewModel.fetchOrders()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
