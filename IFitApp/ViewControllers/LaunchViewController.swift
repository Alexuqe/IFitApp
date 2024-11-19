//
//  ViewController.swift
//  IFit
//
//  Created by Sasha on 15.11.24.
//

import UIKit

final class LaunchViewController: UIViewController {

    let allApps = LoginedApp.getAllLoginedApps()

    let nameAppLabel = UILabel()
    let sloganLabel = UILabel()
    let stackLabels = UIStackView()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "First screen"
        setupUI()
    }

}

private extension LaunchViewController {

    func setupUI() {
        configureNameAppLabel()
        configureSloganLabel()

        configureStackLabels()
        constrainStackLabels()
    }

    func configureNameAppLabel() {
        nameAppLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameAppLabel)

        nameAppLabel.text = allApps.safeApp(for: .eat)?.textOnScreen[0].text.headerText
        nameAppLabel.numberOfLines = 0
        nameAppLabel.adjustsFontSizeToFitWidth = true
        nameAppLabel.font = .systemFont(ofSize: 36, weight: .bold)
//        nameAppLabel.font = .popinsBold36()
        nameAppLabel.textColor = .black
        nameAppLabel.textAlignment = .center
    }

    func configureSloganLabel() {
        nameAppLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sloganLabel)

        sloganLabel.text = allApps.safeApp(for: .eat)?.textOnScreen[0].text.bodyText
        sloganLabel.numberOfLines = 0
        sloganLabel.adjustsFontSizeToFitWidth = true
        sloganLabel.font = .systemFont(ofSize: 18)
        sloganLabel.textColor = .colorNumber05
        sloganLabel.textAlignment = .center
    }

    func configureStackLabels() {
        stackLabels.axis = .vertical
        stackLabels.distribution = .fillEqually
        stackLabels.spacing = 15
        stackLabels.addArrangedSubview(nameAppLabel)
        stackLabels.addArrangedSubview(sloganLabel)
        view.addSubview(stackLabels)
    }


    func constrainStackLabels() {
        stackLabels.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackLabels.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackLabels.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackLabels.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackLabels.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }


}

//#Preview {
//    let viewController = MainViewController()
//    viewController
//}
