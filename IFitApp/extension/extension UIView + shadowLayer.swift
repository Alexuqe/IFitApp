    //
    //  extension UIView + shadowLayer.swift
    //  IFitApp
    //
    //  Created by Sasha on 21.11.24.
    //

import Foundation
import UIKit



extension UIView {
    
    func addShadow(color: UIColor, opacity: Float, radius: CGFloat, offsetWidth: CGFloat, offsetHeight: CGFloat) {
            // Создаем слой для тени
        let shadowLayer = CALayer()
        shadowLayer.shadowColor = color.cgColor
        shadowLayer.frame = bounds// Устанавливаем начальные размеры
        shadowLayer.shadowOpacity = opacity
        shadowLayer.shadowRadius = radius
        shadowLayer.shadowOffset = CGSize(width: offsetWidth, height: offsetHeight)
        shadowLayer.masksToBounds = false
        
        let shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: radius)
        shadowLayer.shadowPath = shadowPath.cgPath
        
        
        self.layer.insertSublayer(shadowLayer, at: 0) // Добавляем под основной слой
    }


        }

//
//#Preview {
//    let viewController = LaunchViewController()
//    viewController
//}

