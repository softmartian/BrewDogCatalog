//
//  BeerViewController.swift
//  BeerView
//
//  Created by Admin on 7/8/20.
//  Copyright © 2020 Adevinta. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import UIKit
import SnapKit
import BeerMediator

 class BeerViewController: UIViewController {

    lazy var label: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.red
        view.addSubview(label)
        return label
    }()

    lazy var recommendationView: UIView = {
        let view = UIView()
        self.view.addSubview(view)
        return view
    }()


    let bag = DisposeBag()
    let presenter: BeerPresenterProtocol
    let recommendationMediator: BeerListingMediatorProtocol?

     init(presenter: BeerPresenterProtocol, recommendations: BeerListingMediatorProtocol?) {
        self.presenter = presenter
        self.recommendationMediator = recommendations
        super.init(nibName: nil, bundle: nil)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupConstraints()
        subscribe()
    }

    func setupRecommendationView(params: [String: Any]) {
        guard let recommendationViewController = recommendationMediator?.getBeerListingViewController(params: params) else {
            return
        }
        self.addChild(recommendationViewController)
        recommendationView.addSubview(recommendationViewController.view)
        recommendationViewController.didMove(toParent: self)
        recommendationViewController.view.frame = recommendationView.bounds
    }

    func setupConstraints() {
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }

        recommendationView.snp.makeConstraints { make in
            make.leading.bottom.trailing.equalToSuperview().inset(12)
            make.height.equalTo(200)
        }
    }

    func subscribe() {
        presenter.item.bind(to: label.rx.text).disposed(by: bag)
        presenter.recommendations.subscribe(onNext: {[weak self] params in self?.setupRecommendationView(params: params)}).disposed(by: bag)
    }
}
