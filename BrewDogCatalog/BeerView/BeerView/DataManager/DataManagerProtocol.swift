//
//  DataManagerProtocol.swift
//  BeerView
//
//  Created by Admin on 7/10/20.
//  Copyright © 2020 Adevinta. All rights reserved.
//

import Foundation
import RxSwift

protocol DataManagerProtocol {
    func getBeer(id: String) -> Observable<BeerEntity>
}
