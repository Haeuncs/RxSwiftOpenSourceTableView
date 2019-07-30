//
//  OpenSourceLicenseViewModel.swift
//  RxSwiftOpenSourceMVVM
//
//  Created by LEE HAEUN on 2019/07/30.
//  Copyright © 2019 LEE HAEUN. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class OpenSourceLicenseViewModel {
  let openSourceArr: [OpenSourceLicenseModel] = [
    OpenSourceLicenseModel(title: "Alamofire", author: URL(string: "https://github.com/Alamofire/Alamofire/blob/master/LICENSE")!, license: "MIT License"),
    OpenSourceLicenseModel(title: "BetterSegmentedControl", author: URL(string: "https://github.com/gmarm/BetterSegmentedControl/blob/master/LICENSE")!, license: "MIT License"),
    OpenSourceLicenseModel(title: "CropPickerView", author: URL(string: "https://github.com/pikachu987/CropPickerView/blob/master/LICENSE")!, license: "MIT License"),
    OpenSourceLicenseModel(title: "FacebookSDK", author: URL(string: "https://github.com/facebook/facebook-swift-sdk/blob/master/LICENSE")!, license: "MIT License"),
    OpenSourceLicenseModel(title: "Firebase", author: URL(string: "https://github.com/firebase/firebase-ios-sdk/blob/master/LICENSE")!, license: "Apache License 2.0"),
    OpenSourceLicenseModel(title: "IQKeyboardManagerSwift", author: URL(string: "https://github.com/hackiftekhar/IQKeyboardManager/blob/master/LICENSE.md")!, license: "MIT License"),
    OpenSourceLicenseModel(title: "Kingfisher", author: URL(string: "https://github.com/onevcat/Kingfisher/blob/master/LICENSE")!, license: "MIT License"),
    OpenSourceLicenseModel(title: "SnapKit", author: URL(string: "https://github.com/SnapKit/SnapKit/blob/develop/LICENSE")!, license: "MIT License"),
    OpenSourceLicenseModel(title: "PocketSVG", author: URL(string: "https://github.com/pocketsvg/PocketSVG/blob/master/LICENSE")!, license: "MIT License"),
    OpenSourceLicenseModel(title: "Parchment", author: URL(string: "https://github.com/rechsteiner/Parchment/blob/master/LICENSE")!, license: "MIT License"),
    OpenSourceLicenseModel(title: "RxSwift", author: URL(string: "https://github.com/ReactiveX/RxSwift/blob/master/LICENSE.md")!, license: "MIT License"),
  ]
  lazy var data: Driver<[OpenSourceLicenseModel]> = {
    return Observable.of(openSourceArr).asDriver(onErrorJustReturn: [])
  }()
  
}
