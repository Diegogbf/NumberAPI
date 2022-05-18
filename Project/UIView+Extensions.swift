//
//  UIView+Extensions.swift
//  Teste-iOS
//
//  Created by Diego Gomes on 04/04/21.
//

import UIKit

extension UIView {
    func pinToSuperView(constant: CGFloat = 0.0) {
        guard let superview = superview else { return }
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: constant),
            self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: -constant),
            self.topAnchor.constraint(equalTo: superview.topAnchor, constant: constant),
            self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -constant)
        ])
    }

    @discardableResult func leading(
        to anchor: NSLayoutXAxisAnchor,
        constant: CGFloat
    ) -> UIView {
        let constraint = self.leadingAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.isActive = true
        return self
    }

    @discardableResult func trailing(
        to anchor: NSLayoutXAxisAnchor,
        constant: CGFloat
    ) -> UIView {
        let constraint = self.trailingAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.isActive = true
        return self
    }

    @discardableResult func bottom(
        to anchor: NSLayoutYAxisAnchor,
        constant: CGFloat
    ) -> UIView {
        let constraint = self.bottomAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.isActive = true
        return self
    }

    @discardableResult func bottom(
        lessThan anchor: NSLayoutYAxisAnchor,
        constant: CGFloat
    ) -> UIView {
        let constraint = self.bottomAnchor.constraint(lessThanOrEqualTo: anchor, constant: constant)
        constraint.isActive = true
        return self
    }

    @discardableResult func height(
        constant: CGFloat,
        priority: UILayoutPriority = .required
    ) -> UIView {
        let constraint = self.heightAnchor.constraint(equalToConstant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult func width(
        constant: CGFloat,
        priority: UILayoutPriority = .required
    ) -> UIView {
        let constraint = self.widthAnchor.constraint(equalToConstant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult func top(
        to anchor: NSLayoutYAxisAnchor,
        constant: CGFloat
    ) -> UIView {
        let constraint = self.topAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.isActive = true
        return self
    }

    @discardableResult func leadingToSuperview(constant: CGFloat) -> UIView {
        guard let superview = superview else { fatalError("View has no parent") }
        return leading(to: superview.leadingAnchor, constant: constant)
    }

    @discardableResult func trailingToSuperview(constant: CGFloat) -> UIView {
        guard let superview = superview else { fatalError("View has no parent") }
        return trailing(to: superview.trailingAnchor, constant: constant)
    }

    @discardableResult func bottomToSuperview(constant: CGFloat) -> UIView {
        guard let superview = superview else { fatalError("View has no parent") }
        return bottom(to: superview.bottomAnchor, constant: constant)
    }

    @discardableResult func topToSuperview(constant: CGFloat) -> UIView {
        guard let superview = superview else { fatalError("View has no parent") }
        return top(to: superview.topAnchor, constant: constant)
    }

    @discardableResult func centerXAnchor(
        to anchor: NSLayoutXAxisAnchor,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .required
    ) -> UIView {
        let constraint = self.centerXAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }

    @discardableResult func centerYAnchor(
        to anchor: NSLayoutYAxisAnchor,
        constant: CGFloat = 0,
        priority: UILayoutPriority = .required
    ) -> UIView {
        let constraint = self.centerYAnchor.constraint(equalTo: anchor, constant: constant)
        constraint.priority = priority
        constraint.isActive = true
        return self
    }
}
