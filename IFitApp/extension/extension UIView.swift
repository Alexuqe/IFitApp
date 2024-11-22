    //
    //  extension UIView.swift
    //  IFitApp
    //
    //  Created by Sasha on 20.11.24.
    //

import Foundation
import UIKit



extension UIView {
    func addVerticalGradientLayer(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.4]
        gradient.startPoint = CGPoint(x: 0.25, y: 0.15)
        gradient.endPoint = CGPoint(x: 0.75, y: 0.5)
        gradient.cornerRadius = bounds.height / 2
        layer.insertSublayer(gradient, at: 0)
        clipsToBounds = true
    }

}
//
//#Preview {
//    let viewController = LoginViewController()
//    viewController
//}
