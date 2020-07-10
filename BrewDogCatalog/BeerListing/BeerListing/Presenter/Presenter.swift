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
    
    var items: Observable<[BeerEntity]> {
        return manager.getBeers(params: params).observeOn(MainScheduler.instance)
    }
    
    let params: [String: Any]
    
    let router: RouterProtocol

    let manager: DataManagerProtocol
    
    init(manager: DataManagerProtocol, router: RouterProtocol, params: [String: Any]) {
        self.manager = manager
        self.router = router
        self.params = params
    }
    
    func itemSelected(id: String, from viewController: UIViewController) {
        router.showBeer(id: id, from: viewController)
    }
    
}
