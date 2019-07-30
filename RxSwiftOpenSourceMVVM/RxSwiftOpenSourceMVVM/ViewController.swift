//
//  ViewController.swift
//  RxSwiftOpenSourceMVVM
//
//  Created by LEE HAEUN on 2019/07/30.
//  Copyright © 2019 LEE HAEUN. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import SafariServices

class OpenSourceLicenseViewController: UIViewController {
  let disposeBag = DisposeBag()
  let tableView = UITableView()
  let viewModel = OpenSourceLicenseViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "오픈소스 라이센스"
    navigationController?.navigationBar.tintColor = .black
    view.addSubview(tableView)
    view.backgroundColor = .white
    tableView.separatorStyle = .none
    tableView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0.0),
      tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0.0),
      tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0.0),
      tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0.0)
      ])
    
    tableView.register(OpenSourceTableViewCell.self, forCellReuseIdentifier: "cell")
    
    viewModel.data.asObservable()
      .bind(to: tableView.rx.items(cellIdentifier: "cell", cellType: OpenSourceTableViewCell.self)) {
        row, model, cell in
        cell.openSourceModel = model
      }.disposed(by: disposeBag)
    
    tableView.rx.modelSelected(OpenSourceLicenseModel.self)
      .map{ $0.author }
      .subscribe(onNext: { [weak self] url in
        self?.present(SFSafariViewController(url: url), animated: true)
      }).disposed(by: disposeBag)
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.navigationBar.isHidden = false
    // 이전 selected cell 을 deselect 해줌
    if let indexPath = tableView.indexPathForSelectedRow {
      tableView.deselectRow(at: indexPath, animated: true)
    }
  }
}
