//
//  DataManager.swift
//  BeerView
//
//  Created by Admin on 7/10/20.
//  Copyright © 2020 Adevinta. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import Moya_ObjectMapper

class DataManager: DataManagerProtocol {
    let api: MoyaProvider<BeerViewMoyaService>

    init(api: MoyaProvider<BeerViewMoyaService>) {
        self.api = api
    }

    func getBeer(id: String) -> Observable<BeerEntity> {
        return api.rx.request(.singleBeer(id: id)).mapArray(BeerEntity.self).asObservable().map {$0.first!}
    }
}
