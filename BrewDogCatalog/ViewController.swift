//
//  ViewController.swift
//  BrewDogCatalog
//
//  Created by Admin on 7/8/20.
//  Copyright © 2020 Adevinta. All rights reserved.
//

import UIKit
import BeerFunHouse

class ViewController: UITabBarController {

    let features = FeatureAssembly.instance

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
    }

    private func setupViewControllers() {
        let listItem = UITabBarItem(title: "Listing", image: nil, selectedImage: nil)
        let listingVC = features.listing.getBeerListingViewController(params: ["": ""])
        let listingNavigation = UINavigationController(rootViewController: listingVC)
        listingNavigation.tabBarItem = listItem

        let viewItem = UITabBarItem(title: "View", image: nil, selectedImage: nil)
        let viewVC = features.view.getBeerViewController(id: "123")
           let viewNavigation = UINavigationController(rootViewController: viewVC)
           viewNavigation.tabBarItem = viewItem

        viewControllers = [listingNavigation, viewNavigation]


    }
}


