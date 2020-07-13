//
//  BeerEntity.swift
//  BeerView
//
//  Created by Admin on 7/10/20.
//  Copyright © 2020 Adevinta. All rights reserved.
//

import Foundation
import ObjectMapper

struct BeerEntity {
    let name: String
    let id: Int
    let abv: Double
    let ibu: Double
}

extension BeerEntity: ImmutableMappable {
    init(map: Map) throws {
        id = try map.value("id")
        name = try map.value("name")
        abv = try map.value("abv")
        ibu = try map.value("ibu")
    }
}
