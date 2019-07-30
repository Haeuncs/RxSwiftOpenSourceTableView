//
//  OpenSourceTableViewCell.swift
//  RxSwiftOpenSourceMVVM
//
//  Created by LEE HAEUN on 2019/07/30.
//  Copyright © 2019 LEE HAEUN. All rights reserved.
//

import UIKit
import SnapKit

class OpenSourceTableViewCell: UITableViewCell {
  var openSourceModel: OpenSourceLicenseModel? {
    didSet{
      guard let openSourceModel = openSourceModel else { return }
      titleLabel.text = openSourceModel.title
      authorLabel.text = openSourceModel.author.absoluteString
      descriptionLabel.text = openSourceModel.license
    }
  }
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    initView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  func initView(){
    self.addSubview(titleLabel)
    self.addSubview(authorLabel)
    self.addSubview(descriptionLabel)
    self.addSubview(bottomLineView)
    
    titleLabel.snp.makeConstraints{ (make) -> Void in
      make.top.equalTo(self.snp.top).offset(12)
      make.left.equalTo(self.snp.left).offset(16)
      make.right.equalTo(self.snp.right).offset(-16)
    }
    authorLabel.snp.makeConstraints{ (make) -> Void in
      make.top.equalTo(titleLabel.snp.bottom).offset(3)
      make.left.equalTo(self.snp.left).offset(16)
      make.right.equalTo(self.snp.right).offset(-16)
    }
    descriptionLabel.snp.makeConstraints{ (make) -> Void in
      make.top.equalTo(authorLabel.snp.bottom).offset(3)
      make.left.equalTo(self.snp.left).offset(16)
      make.right.equalTo(self.snp.right).offset(-16)
    }
    bottomLineView.snp.makeConstraints{ (make) -> Void in
      make.top.equalTo(descriptionLabel.snp.bottom).offset(12)
      make.left.equalTo(self.snp.left).offset(16)
      make.right.equalTo(self.snp.right).offset(-16)
      make.bottom.equalTo(self.snp.bottom).offset(0)
      make.height.equalTo(1)
    }
  }
  
  lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "타이틀"
    label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
    label.textColor = .black
    return label
  }()
  lazy var authorLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
    label.text = "작가"
    label.numberOfLines = 0
    label.textColor = .gray
    return label
  }()
  
  lazy var descriptionLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
    label.text = "설명"
    label.numberOfLines = 0
    label.textColor = .gray
    return label
  }()
  lazy var bottomLineView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .gray
    return view
  }()
}
