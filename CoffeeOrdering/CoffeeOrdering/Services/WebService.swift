//
//  WebService.swift
//  CoffeeOrdering
//
//  Created by Luís Filipe Nascimento on 27/12/22.
//

import Foundation

class WebService {

    public static let shared  = WebService()

    private init() { }

    func createCoffeeOrder(order: Order, completion: @escaping (CreateOrderResponse?) -> Void) {
        guard let url = URL(string: "https://island-bramble.glitch.me/orders") else {
            return
        }

        var request = URLRequest(url: url)

        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(order)

        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }

                return
            }

            let response = try? JSONDecoder().decode(CreateOrderResponse.self, from: data)

            DispatchQueue.main.async {
                completion(response)
            }
        }

        task.resume()
    }

    func getAllOrders(completion: @escaping ([Order]?) -> Void) {
        guard let url = URL(string: "https://island-bramble.glitch.me/orders") else {
            completion(nil)

            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data, error == nil else {
                completion(nil)

                return
            }

            let orders = try? JSONDecoder().decode([Order].self, from: data)

            DispatchQueue.main.async {
                completion(orders)
            }
        }

        task.resume()
    }

}
