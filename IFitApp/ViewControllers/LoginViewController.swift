    //
    //  EatWellViewController.swift
    //  IFitApp
    //
    //  Created by Sasha on 22.11.24.
    //

import UIKit

final class LoginViewController: UIViewController {

    var user = User.getUser()

    let subtitleLabel = UILabel()
    let welcomLabel = UILabel()

    let loginButton = UIButton()
    let forgotPasswordButton = UIButton()

    let labelStackView = UIStackView()
    let textFieldStackView = UIStackView()

    let customTF: LogedTextField = {
        let tf = LogedTextField()
        tf.configureEmailTextField()
        return tf
    }()

    let passwordTextField: PasswordTextField = {
        let passwordTF = PasswordTextField()
        passwordTF.configurePasswordTextField()
        return passwordTF
    }()




    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true

        setupUI()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }


}


private extension LoginViewController {

    func setupUI() {

        configureSubtitleLabel()
        configureWelcomLabel()

        configureTextFieldStackView()
        configureLabeleStackView()

    }

    func configureSubtitleLabel() {
        subtitleLabel.text = "Hey there,"
        subtitleLabel.font = UIFont().fontRegularStyle(size: 16)
        subtitleLabel.textColor = .black
        subtitleLabel.textAlignment = .center
        subtitleLabel.numberOfLines = 0
        subtitleLabel.adjustsFontSizeToFitWidth = true

        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(subtitleLabel)
    }

    func configureWelcomLabel() {
        welcomLabel.text = "Welcome Back"
        welcomLabel.font = UIFont().fontBoldStyle(size: 20)
        welcomLabel.textColor = .black
        welcomLabel.textAlignment = .center
        welcomLabel.numberOfLines = 0
        welcomLabel.adjustsFontSizeToFitWidth = true

        welcomLabel.translatesAutoresizingMaskIntoConstraints = true
        view.addSubview(welcomLabel)
    }

    func configureLabeleStackView() {
        labelStackView.addArrangedSubview(subtitleLabel)
        labelStackView.addArrangedSubview(welcomLabel)
        labelStackView.axis = .vertical
        labelStackView.spacing = 5
        labelStackView.alignment = .fill

        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelStackView)

        constrainLabelStackView()
    }

    func configureTextFieldStackView() {
        textFieldStackView.axis = .vertical
        textFieldStackView.spacing = 15
        textFieldStackView.alignment = .fill
        textFieldStackView.distribution = .fillProportionally
        textFieldStackView.addArrangedSubview(customTF)
        textFieldStackView.addArrangedSubview(passwordTextField)

        textFieldStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textFieldStackView)
        constrainTextFieldStackView()
    }

        //MARK: Constrains
    func constrainTextFieldStackView() {
        NSLayoutConstraint.activate([
            textFieldStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            textFieldStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            textFieldStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20)
        ])
    }

    func constrainLabelStackView() {
        NSLayoutConstraint.activate([
            labelStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            labelStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            labelStackView.bottomAnchor.constraint(equalTo: textFieldStackView.topAnchor, constant: -30)
        ])
    }



}


extension LoginViewController: UITextFieldDelegate {

}

#Preview {
    let viewController = LoginViewController()
    viewController
}


