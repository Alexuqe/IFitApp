    //
    //  TrackYouViewController.swift
    //  IFitApp
    //
    //  Created by Sasha on 21.11.24.
    //

import UIKit

final class TrackYouViewController: UIViewController {

    var typeTraine: [LoginedApp]!

    let trackYouGoalImage = UIImageView()
    let screenProgressView = UIProgressView()
    let progressView = CircularProgressView()
    let nextScreenButton = UIButton()

    var screenIndex = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Two screen"
        setupUI()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        nextScreenButton.addVerticalGradientLayer(topColor: .colorNumber01, bottomColor: .colorNumber02.withAlphaComponent(0.7))
    }

    override func viewWillAppear(_ animated: Bool) {
        updateProgressView()
    }

}



private extension TrackYouViewController {

    func setupUI() {
        view.addSubview(progressView)
        view.addSubview(nextScreenButton)

        configureTrackYouImageView()
        configureNextScreenButton()
        configureProgressView()

        setupConstraitButton()
    }

    func updateProgressView() {
        let totalScreens = TypeTraine.allCases.count
        let totalProgress = Float(screenIndex) / Float(totalScreens)
        progressView.setProgress(CGFloat(totalProgress), animated: true)
    }

    func configureTrackYouImageView() {
        trackYouGoalImage.image = UIImage(named: "TrackYouGoal")
        trackYouGoalImage.contentMode = .scaleAspectFill
        trackYouGoalImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(trackYouGoalImage)
        setupConstraintImageView()
    }

    func configureProgressView() {
//        screenProgressView.progressViewStyle = .default
//        screenProgressView.translatesAutoresizingMaskIntoConstraints = false
//        screenProgressView.backgroundColor = .colorNumber04
//        screenProgressView.progress = 10
//        screenProgressView.trackTintColor = .gray
//        screenProgressView.progressTintColor = .red
//        view.addSubview(screenProgressView)
//        setupConstraitProgressView()

        progressView.translatesAutoresizingMaskIntoConstraints = false
        setupConstraitProgressView()
    }

    func configureNextScreenButton() {
        var configure = UIButton.Configuration.plain()
        configure.cornerStyle = .capsule
        configure.titleAlignment = .center
        configure.image = UIImage(systemName: "arrow.right")
        configure.baseForegroundColor = .white
        nextScreenButton.configuration = configure
        nextScreenButton.translatesAutoresizingMaskIntoConstraints = false
        nextScreenButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
    }

    @objc func tapButton() {
        let eatView = EatWellViewController()
        eatView.typeTraine = typeTraine
        eatView.screenIndex = 2
        navigationController?.pushViewController(eatView, animated: true)

    }

    func setupConstraintImageView() {
        NSLayoutConstraint.activate(
            [
                trackYouGoalImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
                trackYouGoalImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
                trackYouGoalImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
                trackYouGoalImage.heightAnchor.constraint(equalToConstant: 410)
            ]
        )
    }

    func setupConstraitProgressView() {
        NSLayoutConstraint.activate(
            [
                progressView.widthAnchor.constraint(equalToConstant: 80),
                progressView.heightAnchor.constraint(equalToConstant: 80),
                progressView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
                progressView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)
            ]
        )
    }

    func setupConstraitButton() {
        NSLayoutConstraint.activate(
            [
                nextScreenButton.centerYAnchor.constraint(equalTo: progressView.centerYAnchor, constant: 0),
                nextScreenButton.centerXAnchor.constraint(equalTo: progressView.centerXAnchor, constant: 0),
                nextScreenButton.heightAnchor.constraint(equalToConstant: 70),
                nextScreenButton.widthAnchor.constraint(equalToConstant: 70)
            ]
        )
    }



}
#Preview {
    let viewController = TrackYouViewController()
    viewController
}
