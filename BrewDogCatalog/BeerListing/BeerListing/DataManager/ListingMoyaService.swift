//
//  ListingMoyaService.swift
//  BeerListing
//
//  Created by Admin on 7/10/20.
//  Copyright © 2020 Adevinta. All rights reserved.
//

import Foundation
import Moya

enum ListingMoyaService {
    case beerList(params: [String: Any])
}

extension ListingMoyaService: TargetType {
    var baseURL: URL {
        URL(string: "https://api.punkapi.com")!
    }

    var path: String {
        "/v2/beers/"
    }

    var method: Moya.Method {
        .get
    }

    var sampleData: Data {
        Data()
    }

    var task: Task {
        switch self {
        case .beerList(let params):
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }

    var headers: [String : String]? {
        nil
    }
}
