//
//  AddCoffeeOrderView.swift
//  CoffeeOrdering
//
//  Created by Luís Filipe Nascimento on 02/01/23.
//

import SwiftUI

struct AddCoffeeOrderView: View {

    @Binding var isPresented: Bool
    @ObservedObject var addCoffeeOrderVM = AddCoffeeOrderViewModel(webService: .shared)

    var body: some View {
        NavigationView {

            VStack {
                Form {
                    Section("Information") {
                        TextField("Enter name", text: self.$addCoffeeOrderVM.name)
                    }

                    Section("Select Coffee") {
                        ForEach(addCoffeeOrderVM.coffeeList, id: \.name) { coffee in

                            CoffeeCellView(
                                coffeeVM: coffee,
                                selection: self.$addCoffeeOrderVM.coffeeName
                            )

                        }
                    }

                    Section {
                        Picker("", selection: self.$addCoffeeOrderVM.size) {
                            Text("Small").tag("Small")
                            Text("Medium").tag("Medium")
                            Text("Large").tag("Large")
                        }.pickerStyle(.segmented)
                    } header: {
                        Text("Select Coffee")
                    } footer: {
                        OrderTotalView(total: self.addCoffeeOrderVM.total)
                    }

                    HStack {
                        Spacer()

                        Button("Place Order") {
                            self.addCoffeeOrderVM.placeOrder()
                            self.isPresented = false
                        }

                        Spacer()
                    }
                }
            }

            .navigationTitle("Add Order")
        }
    }
}

struct AddCoffeeOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddCoffeeOrderView(isPresented: .constant(false))
    }
}

struct CoffeeCellView: View {

    let coffeeVM: CoffeeViewModel
    @Binding var selection: String

    var body: some View {
        HStack {
            Image(coffeeVM.imageURL)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(16)

            Text(coffeeVM.name)
                .font(.title3)
                .padding(.leading, 20)

            Spacer()

            Image(systemName: self.selection == self.coffeeVM.name ? "checkmark" : "")
                .padding()
        }.onTapGesture {
            self.selection = self.coffeeVM.name
        }
    }
}
