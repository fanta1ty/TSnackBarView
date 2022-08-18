//
//  TSnackBarView.swift
//  TSnackBarView
//
//  Created by Nguyen, Thinh on 13/08/2022.
//

import Foundation
import UIKit

public final class TSnackBarView: UIView {
    private enum Const {
        static let normalBackgroundColor: UIColor = UIColor(rgb: 0xd2ddef)
        static let successBackgroundColor: UIColor = UIColor(rgb: 0xd4ecde)
        static let errorBackgroundColor: UIColor = UIColor(rgb: 0xffd1d1)
        
        static let normalTextColor: UIColor = UIColor(rgb: 0x113268)
        static let successTextColor: UIColor = UIColor(rgb: 0x195f35)
        static let errorTextColor: UIColor = UIColor(rgb: 0xb30000)
        
        static let defaultTextFont: UIFont = UIFont.systemFont(ofSize: 14)
        
        static let defaultCornerRadius: CGFloat = 3.0
        static let defaultButtonCornerRadius: CGFloat = 10.0
        static let defaultMinHeight: CGFloat = 50.0
        static let defaultActionButtonSize: CGFloat = 20.0
        static let defaultButtonPadding: CGFloat = 15.0
        
        static let defaultLayoutMargins: UIEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
    // MARK: - Private Properties
    private static let bundle = Bundle(for: TSnackBarView.self)
    private let style: TSnackBarViewStyle
    private(set) var onTapActionClosure: TSnackBarViewClosure?
    
    private let label: UILabel = {
        let tempLabel = UILabel()
        tempLabel.numberOfLines = 3
        return tempLabel
    }()
    
    private lazy var stackView: UIStackView = {
        let tempStackView = UIStackView()
        tempStackView.axis = .horizontal
        tempStackView.distribution = .fill
        return tempStackView
    }()
    
    private lazy var actionContainerView: UIView = {
       let tempView = UIView()
        tempView.translatesAutoresizingMaskIntoConstraints = false
        return tempView
    }()
    
    private lazy var actionButton: UIButton = {
        let tempButton = UIButton(type: .system)
        tempButton.setContentHuggingPriority(.required, for: .horizontal)
        tempButton.addTarget(self,
                             action: #selector(onTapActionButton),
                             for: .touchUpInside)
        return tempButton
    }()
    
    // MARK: - Public Properties
    public init(style: TSnackBarViewStyle) {
        self.style = style
        super.init(frame: .zero)
        
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
}

// MARK: - Public Functions
extension TSnackBarView {
    public func show(_ completion: (() -> Void)? = nil) {
        transform = .init(translationX: 0, y: -200)
        
        UIView.animate(withDuration: 0.3,
                       delay: 0.0,
                       options: .curveEaseOut,
                       animations: {
            self.transform = .init(translationX: 0, y: 0)
        }, completion: { _ in
            completion?()
        })
    }
    
    public func dismiss(_ completion: (() -> Void)? = nil) {
        UIView.animate(withDuration: 0.3,
                       delay: 0.0,
                       options: .curveEaseOut,
                       animations: {
            self.transform = .init(translationX: 0, y: -200)
        }, completion: { _ in
            self.removeFromSuperview()
            completion?()
        })
    }
    
    public func updateUI(with viewModel: TSnackBarViewModel) {
        var iconImage: UIImage?
        
        if #available(iOS 13.0, *) {
            iconImage = UIImage(systemName: "multiply",
                                withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))?.withPadding(Const.defaultButtonPadding)
        } else {
            iconImage = UIImage(named: "multiply",
                                in: TSnackBarView.bundle,
                                compatibleWith: nil)?.withPadding(Const.defaultButtonPadding)
        }
        
        actionButton.setImage(iconImage, for: .normal)
        actionButton.isHidden = viewModel.onTapCloseAction == nil
        actionButton.backgroundColor = .white
        actionButton.tintColor = UIColor(rgb: 0x000000)
        actionButton.layer.cornerRadius = Const.defaultButtonCornerRadius
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = viewModel.text
        onTapActionClosure = viewModel.onTapCloseAction
    }
}

// MARK: - Private Functions
extension TSnackBarView {
    private func setup() {
        setUpStyles()
        setUpSubviews()
        setUpLayout()
        addGestureRecognizers()
    }
    
    private func setUpStyles() {
        layer.cornerRadius = Const.defaultCornerRadius
        backgroundColor = {
            switch style {
            case .normal: return Const.normalBackgroundColor
            case .success: return Const.successBackgroundColor
            case .error: return Const.errorBackgroundColor
            }
        }()
        
        label.textColor = {
            switch style {
            case .normal: return Const.normalTextColor
            case .success: return Const.successTextColor
            case .error: return Const.errorTextColor
            }
        }()
        label.font = Const.defaultTextFont
        
        stackView.layoutMargins = Const.defaultLayoutMargins
        stackView.isLayoutMarginsRelativeArrangement = true
    }
    
    private func setUpSubviews() {
        actionContainerView.addSubview(actionButton)
        
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(actionContainerView)
        addSubview(stackView)
    }
    
    private func setUpLayout() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(greaterThanOrEqualToConstant: Const.defaultMinHeight)
        ])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            actionContainerView.widthAnchor.constraint(equalToConstant: Const.defaultActionButtonSize)
        ])
        actionContainerView.setContentCompressionResistancePriority(.required, for: .horizontal)
        
        NSLayoutConstraint.activate([
            actionButton.topAnchor.constraint(equalTo: actionContainerView.topAnchor),
            actionButton.leadingAnchor.constraint(equalTo: actionContainerView.leadingAnchor),
            actionButton.trailingAnchor.constraint(equalTo: actionContainerView.trailingAnchor),
            actionButton.heightAnchor.constraint(equalToConstant: Const.defaultActionButtonSize)
        ])
        actionButton.setContentCompressionResistancePriority(.required, for: .horizontal)
    }
    
    private func addGestureRecognizers() {
        let downSwipeGesture = UISwipeGestureRecognizer(target: self,
                                                        action: #selector(swipeToDismiss))
        downSwipeGesture.direction = .up
        addGestureRecognizer(downSwipeGesture)
    }
    
    @objc
    private func onTapActionButton() {
        onTapActionClosure?(self)
    }
    
    @objc
    private func swipeToDismiss() {
        dismiss()
    }
}

private extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
           assert(red >= 0 && red <= 255, "Invalid red component")
           assert(green >= 0 && green <= 255, "Invalid green component")
           assert(blue >= 0 && blue <= 255, "Invalid blue component")

           self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
       }

       convenience init(rgb: Int) {
           self.init(
               red: (rgb >> 16) & 0xFF,
               green: (rgb >> 8) & 0xFF,
               blue: rgb & 0xFF
           )
       }
}

private extension UIImage {
    func withPadding(_ padding: CGFloat) -> UIImage? {
        withPadding(x: padding, y: padding)
    }

    func withPadding(x: CGFloat, y: CGFloat) -> UIImage? {
        let newWidth = size.width + 2 * x
        let newHeight = size.height + 2 * y
        let newSize = CGSize(width: newWidth, height: newHeight)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0)
        let origin = CGPoint(x: (newWidth - size.width) / 2, y: (newHeight - size.height) / 2)
        draw(at: origin)
        let imageWithPadding = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return imageWithPadding
    }
}
