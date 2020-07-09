//
//  BeerViewMediator.swift
//  BeerView
//
//  Created by Admin on 7/9/20.
//  Copyright © 2020 Adevinta. All rights reserved.
//

import Foundation
import BeerMediator
import UIKit

class BeerViewMediator: BeerViewMediatorProtocol {

    let assembly: BeerViewAssembly

    init(assembly: BeerViewAssembly) {
        self.assembly = assembly
    }

    func getBeerViewController(id: String) -> UIViewController {
        assembly.id = id
        return assembly.view
     }
}
