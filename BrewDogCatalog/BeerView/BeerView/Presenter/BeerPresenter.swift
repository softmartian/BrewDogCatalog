//
//  BeerPresenter.swift
//  BeerView
//
//  Created by Admin on 7/8/20.
//  Copyright © 2020 Adevinta. All rights reserved.
//

import Foundation
import RxSwift
import RxRelay

class BeerPresenter: BeerPresenterProtocol {
    let id: String
    let manager: DataManagerProtocol
     init(id: String, manager: DataManagerProtocol) {
        self.id = id
        self.manager = manager
    }

     var item: Observable<String> {
        return manager.getBeer(id: id).map {$0.name}.observeOn(MainScheduler.instance)
    }

    var recommendations: Observable<[String: Any]> {
        return manager.getBeer(id: id).map {["abv_lt": $0.abv + 1,
                                             "abv_gt": $0.abv - 1,
                                             "ibu_lt": $0.ibu + 10,
                                             "ibu_gt": $0.ibu - 10]}
            .observeOn(MainScheduler.instance)
    }




}
