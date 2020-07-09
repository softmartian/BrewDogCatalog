//
//  BeerMediator.swift
//  BeerMediator
//
//  Created by Admin on 7/8/20.
//  Copyright © 2020 Adevinta. All rights reserved.
//

import Foundation
import UIKit

public protocol BeerViewMediatorProtocol: class {
    func getBeerViewController(id: String) -> UIViewController
}

public protocol BeerListingMediatorProtocol: class {
    func getBeerListingViewController(params: [String: Any]) -> UIViewController
}
