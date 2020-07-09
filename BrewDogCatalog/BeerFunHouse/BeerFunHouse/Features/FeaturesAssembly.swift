//
//  FeaturesAssembly.swift
//  BeerFunHouse
//
//  Created by Admin on 7/9/20.
//  Copyright © 2020 Adevinta. All rights reserved.
//

import Foundation
import EasyDi
import BeerMediator
import BeerListing
import BeerView

public class FeatureAssembly: Assembly {

    public static var instance: FeatureAssembly {
        let instance = FeatureAssembly.instance()
        instance.setupDependencies()
        return instance
    }

    let listingAssembly = ListingAssembly.instance()
    let viewAssembly = BeerViewAssembly.instance()


    lazy public var listing: BeerListingMediatorProtocol = {
        return listingAssembly.listingMediator
    }()
    

    lazy public var view: BeerViewMediatorProtocol = {
        return viewAssembly.viewMediator
    }()

    private func setupDependencies() {
        listingAssembly.viewMediator = viewAssembly.viewMediator
        viewAssembly.listingMediator = listingAssembly.listingMediator
    }
}
