////  swiftlint:disable all
////
////  The code generated using FigmaExport — Command line utility to export
////  colors, typography, icons and images from Figma to Xcode project.
////
////  https://github.com/RedMadRobot/figma-export
////
////  Don’t edit this code manually to avoid runtime crashes
////
//
//import UIKit
//
//public class Label: UILabel {
//
//    var style: LabelStyle? { nil }
//
//    // Когда размер текста в настройках устройства меняется, автоматически вызывается метод обновления текста
//    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
//        registerForTraitChanges([UITraitPreferredContentSizeCategory.self]) {
//            (self: Self, previousTraits: UITraitCollection) in
//            self.updateText()
//        }
//    }
//
//    /*
//     registerForTraitChanges - это новый метод в iOS для отслеживания изменений в характеристиках интерфейса
//
//     [UITraitPreferredContentSizeCategory.self] - указывает, что мы хотим отслеживать именно изменения размера контента
//
//     Замыкание { (self: Self, previousTraits: UITraitCollection) in ... } срабатывает, когда размер контента меняется
//
//     self.updateText() - вызывает метод обновления текста при изменении размера
//
//     */
//
//    public convenience init(text: String?, textColor: UIColor) {
//        self.init()
//        self.text = text
//        self.textColor = textColor
//    }
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        commonInit()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        commonInit()
//        updateText()
//    }
//
//    private func commonInit() {
//        font = style?.font
//        adjustsFontForContentSizeCategory = true
//    }
//
//    private func updateText() {
//        text = super.text
//    }
//
//    public override var text: String? {
//        get {
//            guard style?.attributes != nil else {
//                return super.text
//            }
//
//            return attributedText?.string
//        }
//        set {
//            guard let style = style else {
//                super.text = newValue
//                return
//            }
//
//            guard let newText = newValue else {
//                attributedText = nil
//                super.text = nil
//                return
//            }
//
//            attributedText = style.attributedString(from: newText, alignment: textAlignment, lineBreakMode: lineBreakMode)
//        }
//    }
//}
//
//public final class TextCaptionBoldLabel: Label {
//
//    override var style: LabelStyle? {
//        .textCaptionBold()
//    }
//}
//
//public final class TextCaptionMediumLabel: Label {
//
//    override var style: LabelStyle? {
//        .textCaptionMedium()
//    }
//}
//
//public final class TextCaptionRegularLabel: Label {
//
//    override var style: LabelStyle? {
//        .textCaptionRegular()
//    }
//}
//
//public final class TextCaptionSemiBoldLabel: Label {
//
//    override var style: LabelStyle? {
//        .textCaptionSemiBold()
//    }
//}
//
//public final class TextLargeTextBoldLabel: Label {
//
//    override var style: LabelStyle? {
//        .textLargeTextBold()
//    }
//}
//
//public final class TextLargeTextMediumLabel: Label {
//
//    override var style: LabelStyle? {
//        .textLargeTextMedium()
//    }
//}
//
//public final class TextLargeTextRegularLabel: Label {
//
//    override var style: LabelStyle? {
//        .textLargeTextRegular()
//    }
//}
//
//public final class TextLargeTextSemiBoldLabel: Label {
//
//    override var style: LabelStyle? {
//        .textLargeTextSemiBold()
//    }
//}
//
//public final class TextMediumTextBoldLabel: Label {
//
//    override var style: LabelStyle? {
//        .textMediumTextBold()
//    }
//}
//
//public final class TextMediumTextMediumLabel: Label {
//
//    override var style: LabelStyle? {
//        .textMediumTextMedium()
//    }
//}
//
//public final class TextMediumTextRegularLabel: Label {
//
//    override var style: LabelStyle? {
//        .textMediumTextRegular()
//    }
//}
//
//public final class TextMediumTextSemiBoldLabel: Label {
//
//    override var style: LabelStyle? {
//        .textMediumTextSemiBold()
//    }
//}
//
//public final class TextSmallTextBoldLabel: Label {
//
//    override var style: LabelStyle? {
//        .textSmallTextBold()
//    }
//}
//
//public final class TextSmallTextMediumLabel: Label {
//
//    override var style: LabelStyle? {
//        .textSmallTextMedium()
//    }
//}
//
//public final class TextSmallTextRegularLabel: Label {
//
//    override var style: LabelStyle? {
//        .textSmallTextRegular()
//    }
//}
//
//public final class TextSmallTextSemiBoldLabel: Label {
//
//    override var style: LabelStyle? {
//        .textSmallTextSemiBold()
//    }
//}
//
//public final class TextSubtitleBoldLabel: Label {
//
//    override var style: LabelStyle? {
//        .textSubtitleBold()
//    }
//}
//
//public final class TextSubtitleMediumLabel: Label {
//
//    override var style: LabelStyle? {
//        .textSubtitleMedium()
//    }
//}
//
//public final class TextSubtitleRegulerLabel: Label {
//
//    override var style: LabelStyle? {
//        .textSubtitleReguler()
//    }
//}
//
//public final class TextSubtitleSemiBoldLabel: Label {
//
//    override var style: LabelStyle? {
//        .textSubtitleSemiBold()
//    }
//}
//
//public final class TitleH1BoldLabel: Label {
//
//    override var style: LabelStyle? {
//        .titleH1Bold()
//    }
//}
//
//public final class TitleH1MediumLabel: Label {
//
//    override var style: LabelStyle? {
//        .titleH1Medium()
//    }
//}
//
//public final class TitleH1RegularLabel: Label {
//
//    override var style: LabelStyle? {
//        .titleH1Regular()
//    }
//}
//
//public final class TitleH1SemiBoldLabel: Label {
//
//    override var style: LabelStyle? {
//        .titleH1SemiBold()
//    }
//}
//
//public final class TitleH2BoldLabel: Label {
//
//    override var style: LabelStyle? {
//        .titleH2Bold()
//    }
//}
//
//public final class TitleH2MediumLabel: Label {
//
//    override var style: LabelStyle? {
//        .titleH2Medium()
//    }
//}
//
//public final class TitleH2SemiBoldLabel: Label {
//
//    override var style: LabelStyle? {
//        .titleH2SemiBold()
//    }
//}
//
//public final class TitleH3BoldLabel: Label {
//
//    override var style: LabelStyle? {
//        .titleH3Bold()
//    }
//}
//
//public final class TitleH3MediumLabel: Label {
//
//    override var style: LabelStyle? {
//        .titleH3Medium()
//    }
//}
//
//public final class TitleH3RegularLabel: Label {
//
//    override var style: LabelStyle? {
//        .titleH3Regular()
//    }
//}
//
//public final class TitleH3SemiBoldLabel: Label {
//
//    override var style: LabelStyle? {
//        .titleH3SemiBold()
//    }
//}
//
//public final class TitleH4BoldLabel: Label {
//
//    override var style: LabelStyle? {
//        .titleH4Bold()
//    }
//}
//
//public final class TitleH4MediumLabel: Label {
//
//    override var style: LabelStyle? {
//        .titleH4Medium()
//    }
//}
//
//public final class TitleH4RegularLabel: Label {
//
//    override var style: LabelStyle? {
//        .titleH4Regular()
//    }
//}
//
//public final class TitleH4SemiBoldLabel: Label {
//
//    override var style: LabelStyle? {
//        .titleH4SemiBold()
//    }
//}
//
//public final class CaptionRegularLabel: Label {
//
//    override var style: LabelStyle? {
//        .captionRegular()
//    }
//}
