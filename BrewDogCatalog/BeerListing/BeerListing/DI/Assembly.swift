//
//  Assembly.swift
//  BeerListing
//
//  Created by Admin on 7/9/20.
//  Copyright © 2020 Adevinta. All rights reserved.
//

import Foundation
import EasyDi
import BeerMediator
import Moya

public protocol ListingAssemblyProtocol {
    static var instance: ListingAssemblyProtocol { get }
    var listingMediator: BeerListingMediatorProtocol { get }
    // MARK: - Dependency
    var viewMediator: BeerViewMediatorProtocol? { get set }
}

public class ListingAssembly: Assembly, ListingAssemblyProtocol {
    
    static public var instance: ListingAssemblyProtocol = ListingAssembly.instance()
    
    public var viewMediator: BeerViewMediatorProtocol?
    var params: [String: Any]?
    
    var router: RouterProtocol {
        guard let viewMediator = self.viewMediator else {
            fatalError("view mediator must be injected")
        }
        return define(init: ListingRouter(viewMediator: viewMediator))
    }
    
    var presenter: ListingPresenterProtocol {
        guard let params = params else {
            fatalError("params must be set")
        }
        return define(init: Presenter(manager: self.manager, router: self.router, params: params))
    }
    
    var view: UIViewController {
        return define(init: BeerListingViewController(presenter: self.presenter))
    }

    var manager: DataManagerProtocol {
        return define(init: DataManager(api: self.api))
    }

    var api: MoyaProvider<ListingMoyaService> {
        return MoyaProvider<ListingMoyaService>()
    }
    
    public var listingMediator: BeerListingMediatorProtocol {
        return define(init: BeerListingMediatorImpl(assembly: self))
    }


}

