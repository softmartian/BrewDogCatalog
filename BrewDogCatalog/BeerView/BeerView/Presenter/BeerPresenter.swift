//
//  BeerPresenter.swift
//  BeerView
//
//  Created by Admin on 7/8/20.
//  Copyright © 2020 Adevinta. All rights reserved.
//

import Foundation
import RxSwift

public class BeerPresenter: BeerPresenterProtocol {

    let id: String
    public init(id: String) {
        self.id = id
    }

    public var item: Observable<String> {
        return Observable.just("Beer id: \(id)")
    }
}
