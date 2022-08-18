//
//  TSnackBarServiceImpl.swift
//  TSnackBarView
//
//  Created by Nguyen, Thinh on 15/08/2022.
//

import Foundation

public final class TSnackBarServiceImpl: TSnackBarService {
    public static var shared = TSnackBarServiceImpl()
    
    private var displayingMessage: String?
    private var timer: Timer?
    
    private init() { }
    
}

extension TSnackBarServiceImpl {
    public func show(on view: UIView,
                     message: String,
                     style: TSnackBarView.TSnackBarViewStyle,
                     onTapCloseAction: TSnackBarViewClosure?) {
        guard displayingMessage != message else { return }
        displayingMessage = message
        
        let snackBarView = TSnackBarView(style: style)
        snackBarView.updateUI(with: .init(text: message,
                                          onTapCloseAction: onTapCloseAction == nil ?
                                          nil : { [unowned self] action in
            
            self.displayingMessage = nil
            onTapCloseAction?(action)
        }))
        
        snackBarView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(snackBarView)
        
        NSLayoutConstraint.activate([
            snackBarView.topAnchor.constraint(equalTo: view.topAnchor, constant: 44),
            snackBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            snackBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
        
        invoke(snackBarView: snackBarView, time: 5.0)
    }
    
    public func invoke(snackBarView: TSnackBarView, time: TimeInterval) {
        weak var snackBarViewWeak = snackBarView
        timer?.invalidate()
        
        if snackBarView.onTapActionClosure == nil {
            timer = .scheduledTimer(withTimeInterval: time,
                                    repeats: false,
                                    block: { [unowned self] _ in
                self.displayingMessage = nil
                snackBarViewWeak?.dismiss()
            })
        }
        
        snackBarView.show()
    }
}
