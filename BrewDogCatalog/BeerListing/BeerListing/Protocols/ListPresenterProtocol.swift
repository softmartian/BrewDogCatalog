//
//  ListPresenterProtocol.swift
//  BeerListing
//
//  Created by Admin on 7/8/20.
//  Copyright © 2020 Adevinta. All rights reserved.
//

import Foundation
import RxSwift

protocol ListingPresenterProtocol {
    var items: Observable<[String]> { get }
    func itemSelected(id: String, from viewController: UIViewController)
}

