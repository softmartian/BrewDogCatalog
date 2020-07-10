//
//  DataManager.swift
//  BeerListing
//
//  Created by Admin on 7/10/20.
//  Copyright © 2020 Adevinta. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import Moya_ObjectMapper

class DataManager: DataManagerProtocol {
    let api: MoyaProvider<ListingMoyaService>

    init(api: MoyaProvider<ListingMoyaService>) {
        self.api = api
    }

    func getBeers(params: [String : Any]) -> Observable<[BeerEntity]> {
        return api.rx.request(.beerList(params: params)).mapArray(BeerEntity.self).asObservable()
    }
}
