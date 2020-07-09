//
//  BeerListingMediatorImpl.swift
//  BeerListing
//
//  Created by Admin on 7/9/20.
//  Copyright © 2020 Adevinta. All rights reserved.
//

import Foundation
import UIKit
import BeerMediator

class BeerListingMediatorImpl: BeerListingMediatorProtocol {

    let assembly: ListingAssembly

    init(assembly: ListingAssembly) {
        self.assembly = assembly
    }

    func getBeerListingViewController(params: [String : Any]) -> UIViewController {
        assembly.params = params
        return assembly.view
    }

}
