//  swiftlint:disable all
//
//  The code generated using FigmaExport — Command line utility to export
//  colors, typography, icons and images from Figma to Xcode project.
//
//  https://github.com/RedMadRobot/figma-export
//
//  Don’t edit this code manually to avoid runtime crashes
//

import UIKit

public extension UIFont {

    static func textCaptionBold() -> UIFont {
        customFont("Poppins-Bold", size: 10.0)
    }

    static func textCaptionMedium() -> UIFont {
        customFont("Poppins-Medium", size: 10.0)
    }

    static func textCaptionRegular() -> UIFont {
        customFont("Poppins-Regular", size: 10.0)
    }

    static func textCaptionSemiBold() -> UIFont {
        customFont("Poppins-SemiBold", size: 10.0)
    }

    static func textLargeTextBold() -> UIFont {
        customFont("Poppins-Bold", size: 16.0)
    }

    static func popinsBold36() -> UIFont {
        customFont("Poppins-Bold", size: 36.0)
    }

    static func textLargeTextMedium() -> UIFont {
        customFont("Poppins-Medium", size: 16.0)
    }

    static func textLargeTextRegular() -> UIFont {
        customFont("Poppins-Regular", size: 16.0)
    }

    static func textLargeTextSemiBold() -> UIFont {
        customFont("Poppins-SemiBold", size: 16.0)
    }

    static func textMediumTextBold() -> UIFont {
        customFont("Poppins-Bold", size: 14.0)
    }

    static func textMediumTextMedium() -> UIFont {
        customFont("Poppins-Medium", size: 14.0)
    }

    static func textMediumTextRegular() -> UIFont {
        customFont("Poppins-Regular", size: 14.0)
    }

    static func textMediumTextSemiBold() -> UIFont {
        customFont("Poppins-SemiBold", size: 14.0)
    }

    static func textSmallTextBold() -> UIFont {
        customFont("Poppins-Bold", size: 12.0)
    }

    static func textSmallTextMedium() -> UIFont {
        customFont("Poppins-Medium", size: 12.0)
    }

    static func textSmallTextRegular() -> UIFont {
        customFont("Poppins-Regular", size: 12.0)
    }

    static func textSmallTextSemiBold() -> UIFont {
        customFont("Poppins-SemiBold", size: 12.0)
    }

    static func textSubtitleBold() -> UIFont {
        customFont("Poppins-Bold", size: 18.0)
    }

    static func textSubtitleMedium() -> UIFont {
        customFont("Poppins-Medium", size: 18.0)
    }

    static func textSubtitleReguler() -> UIFont {
        customFont("Poppins-Regular", size: 18.0)
    }

    static func textSubtitleSemiBold() -> UIFont {
        customFont("Poppins-SemiBold", size: 18.0)
    }

    static func titleH1Bold() -> UIFont {
        customFont("Poppins-Bold", size: 26.0)
    }

    static func titleH1Medium() -> UIFont {
        customFont("Poppins-Medium", size: 26.0)
    }

    static func titleH1Regular() -> UIFont {
        customFont("Poppins-Regular", size: 26.0)
    }

    static func titleH1SemiBold() -> UIFont {
        customFont("Poppins-SemiBold", size: 26.0)
    }

    static func titleH2Bold() -> UIFont {
        customFont("Poppins-Bold", size: 24.0)
    }

    static func titleH2Medium() -> UIFont {
        customFont("Poppins-Regular", size: 24.0)
    }

    static func titleH2SemiBold() -> UIFont {
        customFont("Poppins-SemiBold", size: 24.0)
    }

    static func titleH3Bold() -> UIFont {
        customFont("Poppins-Bold", size: 22.0)
    }

    static func titleH3Medium() -> UIFont {
        customFont("Poppins-Medium", size: 22.0)
    }

    static func titleH3Regular() -> UIFont {
        customFont("Poppins-Regular", size: 22.0)
    }

    static func titleH3SemiBold() -> UIFont {
        customFont("Poppins-SemiBold", size: 22.0)
    }

    static func titleH4Bold() -> UIFont {
        customFont("Poppins-Bold", size: 20.0)
    }

    static func titleH4Medium() -> UIFont {
        customFont("Poppins-Medium", size: 20.0)
    }

    static func titleH4Regular() -> UIFont {
        customFont("Poppins-Regular", size: 20.0)
    }

    static func titleH4SemiBold() -> UIFont {
        customFont("Poppins-SemiBold", size: 20.0)
    }

    static func captionRegular() -> UIFont {
        customFont("Poppins-Regular", size: 8.0)
    }

    private static func customFont(
        _ name: String,
        size: CGFloat,
        textStyle: UIFont.TextStyle? = nil,
        scaled: Bool = false) -> UIFont {

        guard let font = UIFont(name: name, size: size) else {
            print("Warning: Font \(name) not found.")
            return UIFont.systemFont(ofSize: size, weight: .regular)
        }
        
        if scaled, let textStyle = textStyle {
            let metrics = UIFontMetrics(forTextStyle: textStyle)
            return metrics.scaledFont(for: font)
        } else {
            return font
        }
    }
}
