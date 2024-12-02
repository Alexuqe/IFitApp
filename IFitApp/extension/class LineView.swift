//
//  extension UIView + LineView.swift
//  IFitApp
//
//  Created by Sasha on 27.11.24.
//

import Foundation
import UIKit



class LineView: UIView {

    override func draw(_ rect: CGRect) {
        guard !rect.isEmpty else { return }

        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        UIColor.colorNumber07.setStroke()
        path.lineWidth = 5

        path.stroke()
    }


}

#Preview {
    let viewController = LoginViewController()
    viewController
}
