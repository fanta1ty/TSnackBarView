//
//  ViewController+ContentView.swift
//  TSnackBarView_Example
//
//  Created by Nguyen, Thinh on 13/08/2022.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import TSnackBarView

extension ViewController {
    final class ContentView: UIView {
        private lazy var stackView = UIStackView()
        
        init() {
            super.init(frame: .zero)
            addSubviews()
            setupSubviews()
            setupLayout()
        }
        
        @available(*, unavailable)
        required init?(coder: NSCoder) { nil }
    }
}

extension ViewController.ContentView {
    private func addSubviews() {
    }
    
    private func setupSubviews() {
        backgroundColor = .white
    }
    
    private func setupLayout() {
        
    }
}
