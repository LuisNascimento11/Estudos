//
//  Hike.swift
//  Hiking
//
//  Created by Luís Filipe Nascimento on 26/12/22.
//

import Foundation

struct Hike: Identifiable {

    let id = UUID()

    let name: String
    let imageURL: String
    let miles: Double
}

#if DEBUG
extension Hike {
    static func all() -> [Hike] {
        return [
            Hike(name: "Salmonberry Trail", imageURL: "sal", miles: 6),
            Hike(name: "Tom, Dick, and Harry Mountain", imageURL: "tom", miles: 5.8),
            Hike(name: "Tamanawas Falls", imageURL: "tam", miles: 5),
        ]
    }
}
#endif
