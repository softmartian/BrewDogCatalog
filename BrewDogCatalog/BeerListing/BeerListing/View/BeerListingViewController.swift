//
//  BeerListingViewController.swift
//  BeerListing
//
//  Created by Admin on 7/8/20.
//  Copyright © 2020 Adevinta. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import RxDataSources

class BeerListingViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        return tableView
    }()
    
    let presenter: ListingPresenterProtocol
    let bag = DisposeBag()
    
    init(presenter: ListingPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blue.withAlphaComponent(0.5)
        setupConstraints()
        subscribeTableView()
        subscribeTableViewSelection()
    }
    
    private func subscribeTableView() {
        let animation = AnimationConfiguration(insertAnimation: .none, reloadAnimation: .none, deleteAnimation: .automatic)
        
        let dataSource = RxTableViewSectionedAnimatedDataSource<AnimatableSectionModel<String, BeerEntity>>(animationConfiguration: animation, configureCell: {_, tableView, indexPath, viewModel in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = viewModel.name
            return cell
        }, canEditRowAtIndexPath: { _, _ in true})
        
        dataSource.decideViewTransition = { (_, _, changesSet)  in
            return changesSet.count > 0 && changesSet[0].insertedItems.count > 1 ? .reload : .animated
        }
        
        presenter.items
            .startWith([])
            .map {[AnimatableSectionModel(model: "", items: $0)]}
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: bag)
    }
    
    private func subscribeTableViewSelection() {
        let binder = Binder<BeerEntity>(self) {target, value in
            target.presenter.itemSelected(id: "\(value.id)", from: target)
        }
        tableView.rx.modelSelected(BeerEntity.self).bind(to: binder).disposed(by: bag)
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
