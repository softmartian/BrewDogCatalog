//
//  ListingRouter.swift
//  BeerListing
//
//  Created by Admin on 7/8/20.
//  Copyright © 2020 Adevinta. All rights reserved.
//

import Foundation
import UIKit
import BeerMediator

class ListingRouter: RouterProtocol {
    
    let viewMediator: BeerViewMediatorProtocol
    
    init(viewMediator: BeerViewMediatorProtocol) {
        self.viewMediator = viewMediator
    }
    
    func showBeer(id: String, from viewController: UIViewController) {
        let beerVC = viewMediator.getBeerViewController(id: id)
        viewController.navigationController?.pushViewController(beerVC, animated: true)
    }
}
