//
//  ContentView.swift
//  Hiking
//
//  Created by Luís Filipe Nascimento on 26/12/22.
//

import SwiftUI

struct ContentView: View {

    let hikes: [Hike]

    var body: some View {
        NavigationView {
            List(hikes) { hike in
                NavigationLink {
                    HikeDetail(hike: hike)
                } label: {
                    HikeCell(hike: hike)
                }
            }

            .navigationTitle("Hikings")
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(hikes: Hike.all())
    }
}
#endif

struct HikeCell: View {

    let hike: Hike

    var body: some View {
        HStack {
            Image(hike.imageURL)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(16)

            VStack(alignment: .leading) {
                Text(hike.name)

                Text("\(String(format: "%.2f", hike.miles))")
                    .foregroundColor(.secondary)
            }
        }
    }
}
