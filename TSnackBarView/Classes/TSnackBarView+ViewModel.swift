//
//  TSnackBarView+ViewModel.swift
//  TSnackBarView
//
//  Created by Nguyen, Thinh on 13/08/2022.
//

import Foundation

public typealias TSnackBarViewClosure = (TSnackBarView) -> Void

public extension TSnackBarView {
    struct TSnackBarViewModel {
        var text: String
        var onTapCloseAction: TSnackBarViewClosure?
        
        public init(text: String,
                    onTapCloseAction: TSnackBarViewClosure? = nil) {
            self.text = text
            self.onTapCloseAction = onTapCloseAction
        }
    }
}
