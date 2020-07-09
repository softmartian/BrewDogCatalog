//
//  DI.swift
//  BeerView
//
//  Created by Admin on 7/9/20.
//  Copyright © 2020 Adevinta. All rights reserved.
//

import Foundation
import BeerMediator
import EasyDi

public protocol BeerViewAssemblyProtocol {
    static var instance: BeerViewAssemblyProtocol { get }
    var viewMediator: BeerViewMediatorProtocol { get }
    
    // MARK: - Dependency
    var listingMediator: BeerListingMediatorProtocol? { get set}

}

public class BeerViewAssembly: Assembly, BeerViewAssemblyProtocol {

    public static var instance: BeerViewAssemblyProtocol = BeerViewAssembly.instance()

    public var listingMediator: BeerListingMediatorProtocol?

    var id: String?

    var presenter: BeerPresenterProtocol {
        guard let id = id else { fatalError("id must be set")}
        return define(init: BeerPresenter(id: id))
    }

    var view: UIViewController {

        guard let listingMediator = listingMediator else {
            fatalError("mediator must be injected")
        }
        return BeerViewController(presenter: self.presenter, recommendationViewController: listingMediator.getBeerListingViewController(params: ["": ""]))
    }

    public var viewMediator: BeerViewMediatorProtocol {
        return define(init: BeerViewMediator(assembly: self))
    }
}
