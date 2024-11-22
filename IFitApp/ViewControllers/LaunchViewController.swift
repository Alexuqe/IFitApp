//
//  ViewController.swift
//  IFitApp
//
//  Created by Sasha on 20.11.24.
//

import UIKit

final class LaunchViewController: UIViewController {

  //MARK: - Public Methods
  let allApps = LoginedApp.getAllLoginedApps()

  let nameAppLabel = UILabel()
  let sloganLabel = UILabel()

  let buttonGetStarted = UIButton()

  let stackLabels = UIStackView()

  //MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
      navigationItem.hidesBackButton = true
    setupUI()
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    buttonGetStarted.addVerticalGradientLayer(topColor: .colorNumber01, bottomColor: .colorNumber02)
  }

}

private extension LaunchViewController {

  func setupUI() {
    configureNameAppLabel()
    configureSloganLabel()

    configureStackLabels()
    configureGetStartButton()
  }

  func configureNameAppLabel() {
    nameAppLabel.text = allApps.safeApp(for: .login)?.nameApp
    nameAppLabel.numberOfLines = 0
    nameAppLabel.adjustsFontSizeToFitWidth = true
    nameAppLabel.font = UIFont(name: "Poppins-Bold", size: 40)
    nameAppLabel.textColor = .black
    nameAppLabel.textAlignment = .center

    nameAppLabel.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(nameAppLabel)
  }

  func configureSloganLabel() {
    sloganLabel.text = allApps.safeApp(for: .login)?.slogan
    sloganLabel.text = allApps.safeApp(for: .burn)?.textOnScreen[0].text.headerText
    sloganLabel.numberOfLines = 0
    sloganLabel.adjustsFontSizeToFitWidth = true
    sloganLabel.font = UIFont(name: "Poppins-Regular", size: 18)
    sloganLabel.textColor = .colorNumber05
    sloganLabel.textAlignment = .center

    nameAppLabel.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(sloganLabel)
  }

  func configureStackLabels() {
    stackLabels.axis = .vertical
    stackLabels.distribution = .fillProportionally
    stackLabels.spacing = 15
    stackLabels.addArrangedSubview(nameAppLabel)
    stackLabels.addArrangedSubview(sloganLabel)
    view.addSubview(stackLabels)
    constrainStackLabels()
  }

  func configureGetStartButton() {
    var configurButton = UIButton.Configuration.plain()
    configurButton.cornerStyle = .capsule
    configurButton.baseForegroundColor = .white
    configurButton.titleAlignment = .center
    configurButton.contentInsets = NSDirectionalEdgeInsets(
      top: 10,
      leading: 20,
      bottom: 10,
      trailing: 20
    )

    let title = "Get Started"
    let font = UIFont(name: "Poppins-Bold", size: 16)

    var atributedString = AttributedString(title)
    atributedString.font = font
    configurButton.attributedTitle = atributedString
    buttonGetStarted.configuration = configurButton

    buttonGetStarted.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(buttonGetStarted)
    constrainButton()

    buttonGetStarted.addTarget(self, action: #selector(tapOnGetStartedButton), for: .touchUpInside)
  }

  @objc func tapOnGetStartedButton() {
      let viewController = TrackYouViewController()
    viewController.typeTraine = allApps
    viewController.screenIndex = 1
//    print("Passing data to GetBurnViewController: \(allApps)")

    navigationController?.pushViewController(viewController, animated: true)
  }

  func constrainStackLabels() {
    stackLabels.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      stackLabels.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      stackLabels.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      stackLabels.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
      stackLabels.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
    ])
  }

  func constrainButton() {
    NSLayoutConstraint.activate([
        buttonGetStarted.heightAnchor.constraint(equalToConstant: 60),
        buttonGetStarted.bottomAnchor.constraint(
          equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
        buttonGetStarted.leadingAnchor.constraint(
          equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
        buttonGetStarted.trailingAnchor.constraint(
          equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
      ])
  }

}


//
//#Preview {
//    let viewController = LaunchViewController()
//    viewController
//}
