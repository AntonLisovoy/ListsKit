//
//  ExamplesViewController.swift
//  ListsKitExample
//
//  Created by Danil Blinov on 06.09.2020.
//  Copyright © 2020 Danil Blinov. All rights reserved.
//

import UIKit
import ListsKit
import RxSwift

class ExamplesViewController: UIViewController {
	@IBOutlet private weak var tableView: UITableView!
	private let tableController = LKTableController()
	private let viewModel = ExamplesViewModel()
	private let disposeBag = DisposeBag()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		tableController.set(tableView)
		setupRx()
	}
	
	private func setupRx() {
		viewModel.cellModels.bind(to: tableController.cellModels).disposed(by: disposeBag)
		viewModel.showViewController.subscribe(onNext: { [weak self] (viewController) in
			self?.navigationController?.show(viewController, sender: self)
		}).disposed(by: disposeBag)
	}

}
