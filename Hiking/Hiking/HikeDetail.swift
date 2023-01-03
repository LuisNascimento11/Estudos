//
//  HikeDetail.swift
//  Hiking
//
//  Created by Luís Filipe Nascimento on 26/12/22.
//

import SwiftUI

struct HikeDetail: View {

    let hike: Hike
    @State private var zoomed: Bool = false

    var body: some View {
        VStack {
            Image(hike.imageURL)
                .resizable()
                .aspectRatio(contentMode: self.zoomed ? .fill : .fit)
                .onTapGesture {
                    withAnimation {
                        self.zoomed.toggle()
                    }
                }

            Text(hike.name)

            Text("\(String(format: "%.2f", hike.miles))")
                .foregroundColor(.secondary)
        }
        .navigationTitle(hike.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct HikeDetail_Previews: PreviewProvider {
    static var previews: some View {
        HikeDetail(hike: Hike.all().first!)
    }
}
