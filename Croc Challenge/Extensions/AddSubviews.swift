//
//  AddSubviewStack.swift
//  Croc Challenge
//
//  Created by Vitali Martsinovich on 2023-04-18.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ subviews: UIView...) {
        subviews.forEach { addArrangedSubview($0) }
    }
}

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}

extension UIButton {
    func addSubviewsToButton(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}

extension UILabel {
    func addSubviewsToLabel(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}
