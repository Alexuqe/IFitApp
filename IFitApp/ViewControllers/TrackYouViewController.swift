    //
    //  TrackYouViewController.swift
    //  IFitApp
    //
    //  Created by Sasha on 21.11.24.
    //

import UIKit

final class TrackYouViewController: UIViewController {

    //MARK: IB Outlets
    var trackYouGoalImage = UIImageView()
    let progressView = CircularProgressView()
    let nextScreenButton = UIButton()
    var headerLabel = UILabel()
    var secondLabel = UILabel()

    var stackViewLabels = UIStackView()
    var stackViewFirstScreen = UIStackView()
    var stackViewSecondScreen: UIStackView!

    // MARK: - Properties
    var typeTraine: [LoginedApp]!
    var screenIndex = 0

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
        setupUI()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        nextScreenButton.addVerticalGradientLayer(
            topColor: .colorNumber01, bottomColor: .colorNumber02.withAlphaComponent(0.7))
    }

    override func viewWillAppear(_ animated: Bool) {
        updateProgressView()
    }

    // MARK: - IB Actions
    @objc private func tapButton() {
        nextStack()
    }

    // MARK: - Private Methods
   private  func setupUI() {
        view.addSubview(progressView)
        view.addSubview(nextScreenButton)

        configureTrackYouImageView()
        configureNextScreenButton()
        configureheaderLabel()
        configureSecondLAble()

        configureStackViewLabels()
        configureStackViewScreenOne()

        setupConstraitProgressView()
        setupConstraitButton()
    }

    private func updateProgressView() {
        let totalScreens = TypeTraine.allCases.count - 1
        let totalProgress = Float(screenIndex) / Float(totalScreens)
        progressView.setProgress(CGFloat(totalProgress), animated: true)
    }
}

// MARK: Extension TrackYouViewController
extension TrackYouViewController {

    //MARK: Configuration
    func configureTrackYouImageView() {
        trackYouGoalImage.image = UIImage(named: "TrackYouGoal")
        trackYouGoalImage.contentMode = .scaleAspectFill

        trackYouGoalImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(trackYouGoalImage)
    }

    func configureNextScreenButton() {
        var configure = UIButton.Configuration.plain()
        configure.cornerStyle = .capsule
        configure.titleAlignment = .center
        configure.image = UIImage(named: "iconlyLightArrowRight2")
        configure.baseForegroundColor = .white
        nextScreenButton.configuration = configure

        nextScreenButton.translatesAutoresizingMaskIntoConstraints = false
        nextScreenButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
    }

    func configureheaderLabel() {
        headerLabel.text =
        typeTraine?.safeApp(for: [.track])!.textOnScreen.first?.text.headerText ?? "Track You Goal"
        headerLabel.font = UIFont(name: "Poppins-Bold", size: 24)
        headerLabel.textColor = .colorNumber04
        headerLabel.adjustsFontSizeToFitWidth = true
        headerLabel.numberOfLines = 0

        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerLabel)
    }

    func configureSecondLAble() {
        secondLabel.text = typeTraine?.safeApp(for: [.track])?.textOnScreen.first?.text.bodyText
        secondLabel.font = UIFont(name: "Poppins-Regular", size: 14)
        secondLabel.textColor = .colorNumber05
        secondLabel.adjustsFontSizeToFitWidth = true
        secondLabel.numberOfLines = 0

        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(secondLabel)
    }

    func configureStackViewLabels() {
        stackViewLabels.axis = .vertical
        stackViewLabels.distribution = .fillProportionally
        stackViewLabels.alignment = .fill
        stackViewLabels.spacing = 15
        stackViewLabels.addArrangedSubview(headerLabel)
        stackViewLabels.addArrangedSubview(secondLabel)

        stackViewLabels.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackViewLabels)
    }

    func configureStackViewScreenOne() {
        stackViewFirstScreen.axis = .vertical
        stackViewFirstScreen.distribution = .fill
        stackViewFirstScreen.alignment = .fill
        stackViewFirstScreen.spacing = 63
        stackViewFirstScreen.addArrangedSubview(trackYouGoalImage)
        stackViewFirstScreen.addArrangedSubview(stackViewLabels)

        stackViewFirstScreen.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackViewFirstScreen)

        setupConstraintStackViewLabel()
        setupConstraintImageView()
        setupConstrainFirstScreenStackView()
    }

    // MARK: Constrains
    func setupConstraintImageView() {
        NSLayoutConstraint.activate([
            trackYouGoalImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            trackYouGoalImage.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            trackYouGoalImage.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            trackYouGoalImage.heightAnchor.constraint(equalToConstant: 410),
        ])
    }

    func setupConstraitProgressView() {
        progressView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            progressView.widthAnchor.constraint(equalToConstant: 80),
            progressView.heightAnchor.constraint(equalToConstant: 80),
            progressView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            progressView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
        ])
    }

    func setupConstraitButton() {
        NSLayoutConstraint.activate([
            nextScreenButton.centerYAnchor.constraint(equalTo: progressView.centerYAnchor, constant: 0),
            nextScreenButton.centerXAnchor.constraint(equalTo: progressView.centerXAnchor, constant: 0),
            nextScreenButton.heightAnchor.constraint(equalToConstant: 70),
            nextScreenButton.widthAnchor.constraint(equalToConstant: 70),
        ])
    }

    func setupConstraintStackViewLabel() {
        NSLayoutConstraint.activate([
            stackViewLabels.topAnchor.constraint(equalTo: trackYouGoalImage.bottomAnchor, constant: 64),
            stackViewLabels.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            stackViewLabels.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
        ])
    }

    func setupConstrainFirstScreenStackView() {
        NSLayoutConstraint.activate([
            stackViewFirstScreen.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            stackViewFirstScreen.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            stackViewFirstScreen.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
        ])
    }

    func nextStack() {
        screenIndex += 1

        if screenIndex < TypeTraine.allCases.count - 1 {
            updateUI()
        } else {
            let regiseterView = LoginViewController()
            navigationController?.pushViewController(regiseterView, animated: true)
        }
    }

    func updateUI() {

        let currentScreen = typeTraine[screenIndex]
        let newHeaderText = currentScreen.textOnScreen.first?.text.headerText ?? ""
        let newBodyText = currentScreen.textOnScreen.first?.text.bodyText ?? ""
        let newImageName = currentScreen.textOnScreen.first?.text.image ?? "tray"

        let newHeaderLabel = UILabel()
        newHeaderLabel.text = newHeaderText
        newHeaderLabel.font = UIFont(name: "Poppins-Bold", size: 24)
        newHeaderLabel.textColor = .colorNumber04
        newHeaderLabel.adjustsFontSizeToFitWidth = true
        newHeaderLabel.numberOfLines = 0

        let newSecondLabel = UILabel()
        newSecondLabel.text = newBodyText
        newSecondLabel.font = UIFont(name: "Poppins-Regular", size: 14)
        newSecondLabel.textColor = .colorNumber05
        newSecondLabel.adjustsFontSizeToFitWidth = true
        newSecondLabel.numberOfLines = 0

        let newImageView = UIImageView()
        newImageView.image = UIImage(named: newImageName)
        newImageView.contentMode = .scaleAspectFill
        newImageView.translatesAutoresizingMaskIntoConstraints = false

        let newStackViewLabels = UIStackView(arrangedSubviews: [newHeaderLabel, newSecondLabel])
        newStackViewLabels.axis = .vertical
        newStackViewLabels.distribution = .fillProportionally
        newStackViewLabels.alignment = .fill
        newStackViewLabels.spacing = 15
        newStackViewLabels.translatesAutoresizingMaskIntoConstraints = false

        stackViewSecondScreen = UIStackView(arrangedSubviews: [newImageView, newStackViewLabels])
        stackViewSecondScreen.axis = .vertical
        stackViewSecondScreen.distribution = .fill
        stackViewSecondScreen.alignment = .fill
        stackViewSecondScreen.spacing = 63
        stackViewSecondScreen.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stackViewSecondScreen)

            // Set up constraints for the new stack view
        NSLayoutConstraint.activate([
            stackViewSecondScreen.topAnchor.constraint(equalTo: view.topAnchor),
            stackViewSecondScreen.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackViewSecondScreen.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            newImageView.heightAnchor.constraint(equalToConstant: 410),
            newImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            newImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -0),
            newStackViewLabels.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            newStackViewLabels.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)
        ])

            // Position the new stack view off-screen to the right
        stackViewSecondScreen.transform = CGAffineTransform(translationX: view.bounds.width, y: 0)

            // Perform the transition
        UIView.transition(with: view, duration: 0.5, options: .curveEaseInOut, animations: {
            self.stackViewFirstScreen.transform = CGAffineTransform(translationX: -self.view.bounds.width, y: 0)
            self.stackViewSecondScreen.transform = .identity
        }) { _ in
                // After the animation, remove the old stack view and update references
            self.stackViewFirstScreen.removeFromSuperview()
            print("stackViewFirstScreen removed from superview")
            self.stackViewFirstScreen = self.stackViewSecondScreen
            self.trackYouGoalImage = newImageView
            self.headerLabel = newHeaderLabel
            self.secondLabel = newSecondLabel
            self.stackViewLabels = newStackViewLabels
        }
            // Update progress view
        updateProgressView()
    }



}

//    #Preview{
//        let viewController = TrackYouViewController()
//        viewController
//    }
