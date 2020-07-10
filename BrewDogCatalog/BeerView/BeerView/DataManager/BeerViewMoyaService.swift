//
//  BeerViewMoyaService.swift
//  BeerView
//
//  Created by Admin on 7/10/20.
//  Copyright © 2020 Adevinta. All rights reserved.
//

import Foundation
import Moya

enum BeerViewMoyaService {
    case singleBeer(id: String)
}

extension BeerViewMoyaService: TargetType {
    var baseURL: URL {
        URL(string: "https://api.punkapi.com")!
    }

    var path: String {
        switch self {
        case .singleBeer(let id):
            return "/v2/beers/\(id)"
        }
    }

    var method: Moya.Method {
        .get
    }

    var sampleData: Data {
        Data()
    }

    var task: Task {
        .requestPlain
    }

    var headers: [String : String]? {
        nil
    }
}
