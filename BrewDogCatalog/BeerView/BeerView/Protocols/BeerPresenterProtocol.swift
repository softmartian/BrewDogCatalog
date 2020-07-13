//
//  BeerPresenterProtocol.swift
//  BeerView
//
//  Created by Admin on 7/8/20.
//  Copyright © 2020 Adevinta. All rights reserved.
//

import Foundation
import RxSwift

 protocol BeerPresenterProtocol {
    var item: Observable <String> { get }
    var recommendations: Observable<[String: Any]>  { get }
}
