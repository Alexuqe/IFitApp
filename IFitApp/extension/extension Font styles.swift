//
//  extension Font styles.swift
//  IFitApp
//
//  Created by Sasha on 24.11.24.
//

import Foundation
import UIKit

extension UIFont {

    func fontRegularStyle(size: CGFloat) -> UIFont {
        let font = UIFont(name: "Poppins-Regular", size: size) ?? .systemFont(ofSize: 3)
        return font
    }

    func fontBoldStyle(size: CGFloat) -> UIFont {
        let font = UIFont(name: "Poppins-Bold", size: size) ?? .systemFont(ofSize: 3)
        return font
    }

    func fontMediumStyle(size: CGFloat) -> UIFont {
        let font = UIFont(name: "Poppins-Medium", size: size) ?? .systemFont(ofSize: 3)
        return font
    }

    func fotSemiBoldStyle(size: CGFloat) -> UIFont {
        let font = UIFont(name: "Poppins-SemiBold", size: size) ?? .systemFont(ofSize: 3)
        return font
    }


}
