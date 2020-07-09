//
//  Presenter.swift
//  BeerListing
//
//  Created by Admin on 7/8/20.
//  Copyright © 2020 Adevinta. All rights reserved.
//

import Foundation
import RxSwift

class Presenter: ListingPresenterProtocol {
    
    var items: Observable<[String]> {
        let array = ["item1", "item2", "item3"]
        return Observable.just(array)
    }
    
    let params: [String: Any]
    
    let router: RouterProtocol
    
    init(router: RouterProtocol, params: [String: Any]) {
        self.router = router
        self.params = params
    }
    
    func itemSelected(id: String, from viewController: UIViewController) {
        router.showBeer(id: id, from: viewController)
    }
    
}
