//
//  TSnackBarService.swift
//  TSnackBarView
//
//  Created by Nguyen, Thinh on 14/08/2022.
//

import Foundation
import UIKit

public protocol TSnackBarService {
    func show(on view: UIView,
              message: String,
              style: TSnackBarView.TSnackBarViewStyle,
              onTapCloseAction: TSnackBarViewClosure?)
    
    func show(on view: UIView,
              message: String,
              onTapCloseAction: TSnackBarViewClosure?)
}

public extension TSnackBarService {
    func show(on view: UIView,
              message: String,
              onTapCloseAction: TSnackBarViewClosure?) {
        show(on: view,
             message: message,
             style: .normal,
             onTapCloseAction: onTapCloseAction)
    }
}
