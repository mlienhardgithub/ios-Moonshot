//
//  Astronaut.swift
//  Moonshot
//
//  Created by Martin Lienhard on 7/25/22.
//

import Foundation

struct Astronaut: Codable, Hashable, Identifiable {
    let id: String
    let name: String
    let description: String
}
