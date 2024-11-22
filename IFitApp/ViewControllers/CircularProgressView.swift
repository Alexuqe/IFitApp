//
//  extension CircularProgressView.swift
//  IFitApp
//
//  Created by Sasha on 21.11.24.
//

import Foundation


import UIKit

final class CircularProgressView: UIView {
    private var progressLayer = CAShapeLayer()
    private var trackLayer = CAShapeLayer()

    var progress: CGFloat = 0 {
        didSet {
            setNeedsDisplay()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayers()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayers()
    }

    private func setupLayers() {
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineWidth = 2
        trackLayer.strokeColor = UIColor.white.cgColor
        layer.addSublayer(trackLayer)

        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineWidth = 2
        progressLayer.strokeColor = UIColor.colorNumber01.cgColor
        progressLayer.lineCap = .round
        layer.addSublayer(progressLayer)
    }

    override func draw(_ rect: CGRect) {
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let radius = min(bounds.width, bounds.height) / 2 - progressLayer.lineWidth / 2
        let startAngle = -CGFloat.pi / 2
        let endAngle = startAngle + 2 * .pi

        let circlePath = UIBezierPath(arcCenter: center,
                                       radius: radius,
                                       startAngle: startAngle,
                                       endAngle: endAngle,
                                       clockwise: true)

        trackLayer.path = circlePath.cgPath
        progressLayer.path = circlePath.cgPath
        progressLayer.strokeEnd = progress
    }

    func setProgress(_ value: CGFloat, animated: Bool = true) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = progressLayer.strokeEnd
        animation.toValue = value
        animation.duration = animated ? 0.3 : 0
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)

        progressLayer.strokeEnd = value
        progressLayer.add(animation, forKey: "animateProgress")

        progress = value
    }
}

#Preview {
    let viewController = LoginViewController()
    viewController
}



/*


 CircularProgressView: UIView: Класс наследуется от UIView, что означает, что он представляет собой графический элемент, который можно добавить к интерфейсу приложения.

 progressLayer и trackLayer: Это два слоя (CAShapeLayer), которые используются для рисования круга.  trackLayer — это фон (серый круг), а progressLayer — это заполняемая часть (цветная дуга).

 progress: CGFloat = 0: Это свойство определяет текущий уровень прогресса (от 0 до 1). Когда оно изменяется, вызывается setNeedsDisplay(), что заставляет UIView перерисовать себя.

 setupLayers(): Эта функция создает и настраивает trackLayer и progressLayer, задавая их цвет, толщину линии и другие параметры. UIColor.colorNumber01.cgColor предполагает, что где-то в коде определен расширенный цвет с именем colorNumber01.

 draw(_ rect: CGRect): Эта функция вызывается, когда UIView нужно перерисовать себя. Здесь создается путь (UIBezierPath) в форме круга, который затем используется для отрисовки trackLayer и progressLayer. progressLayer.strokeEnd = progress задает длину заполненной дуги в зависимости от значения progress.

 setProgress(_ value: CGFloat, animated: Bool = true): Эта функция устанавливает новый уровень прогресса. Если animated равно true, то изменение прогресса будет анимировано с помощью CABasicAnimation. Анимация плавно меняет значение strokeEnd  progressLayer за 0.3 секунды.
 */
