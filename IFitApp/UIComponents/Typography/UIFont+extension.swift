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

extension UILabel {
    func setCustomFont(fontName: String, size: CGFloat) {
        guard let font = UIFont(name: fontName, size: size) else {
            print("Error: Font '\(fontName)' not found.  Using system font instead.")
            font = UIFont.systemFont(ofSize: size) // Используем системный шрифт по умолчанию, если пользовательский не найден
            return
        }
        self.font = font
    }
}
