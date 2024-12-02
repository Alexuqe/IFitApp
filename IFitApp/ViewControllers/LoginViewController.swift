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
    let separatorStackView = UIStackView()

    let separatorLabel = UILabel()

    let loginTextField: LogedTextField = {
        let loginTextField = LogedTextField()
        loginTextField.configureEmailTextField()
        return loginTextField
    }()

    let passwordTextField: PasswordTextField = {
        let passwordTF = PasswordTextField()
        passwordTF.configurePasswordTextField()
        return passwordTF
    }()

    let linePath: LineView = {
        let line = LineView()
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()

    let linePathRight: LineView = {
        let line = LineView()
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()

    let googleButton = UIButton()
    let faceBookButton = UIButton()
    let stackViewSocialButton = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
        setupUI()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        loginButton.addVerticalGradientLayer(topColor: .colorNumber01, bottomColor: .colorNumber02)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }


}


private extension LoginViewController {

        //MARK: Update UI
    func setupUI() {

        configureSubtitleLabel()
        configureWelcomLabel()

        configureTextFieldStackView()
        configureLabeleStackView()

        configureLoginButton()

        configureLeftSeparatorLine()
        configureSeparatorLabel()
        configureRightSeparatorLine()

        configureSeparatorStackView()

        configureGoogleButton()
        configureFacebookButton()

        stackViewSocialLoggedButton()
    }

        //MARK: Configure UI
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
        textFieldStackView.distribution = .fill
        textFieldStackView.addArrangedSubview(loginTextField)
        textFieldStackView.addArrangedSubview(passwordTextField)

        textFieldStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textFieldStackView)
        constrainTextFieldStackView()
    }

    func configureLoginButton() {

        var configurButton = UIButton.Configuration.plain()
        configurButton.cornerStyle = .capsule
        configurButton.image = UIImage(named: "iconlyLightLogin")
        configurButton.baseForegroundColor = .white
        configurButton.titleAlignment = .center
        configurButton.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)

        let font = UIFont().fontBoldStyle(size: 16)
        let title = " Login"
        var atributed = AttributedString(title)
        atributed.font = font
        configurButton.attributedTitle = atributed

        loginButton.configuration = configurButton
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginButton)

        configureConstrainButton()

        loginButton.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
    }

    func configureSeparatorLabel() {
        separatorLabel.text = "Or"
        separatorLabel.font = UIFont().fontRegularStyle(size: 12)
        separatorLabel.textColor = .black
        separatorLabel.textAlignment = .center

        separatorLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(separatorLabel)
    }

    func configureLeftSeparatorLine() {
        linePath.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(linePath)
    }

    func configureRightSeparatorLine() {
        linePathRight.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(linePathRight)
    }

    func configureSeparatorStackView() {
        separatorStackView.axis = .horizontal
        separatorStackView.spacing = 5
        separatorStackView.alignment = .center
        separatorStackView.distribution = .equalCentering

        separatorStackView.addArrangedSubview(linePath)
        separatorStackView.addArrangedSubview(separatorLabel)
        separatorStackView.addArrangedSubview(linePathRight)

        separatorStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(separatorStackView)

        configureConstrainSeparatorStackVIew()
    }

    func configureGoogleButton() {
        var configureGoogleButton = UIButton.Configuration.borderless()
        configureGoogleButton.image = UIImage.google
        configureGoogleButton.buttonSize = .large
        configureGoogleButton.cornerStyle = .large
        configureGoogleButton.background.strokeColor = .colorNumber07
        configureGoogleButton.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        configureGoogleButton.imageColorTransformer = .grayscale
        googleButton.configuration = configureGoogleButton
        googleButton.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(googleButton)
    }

    func configureFacebookButton() {
        var configureGoogleButton = UIButton.Configuration.borderless()
        configureGoogleButton.image = UIImage.facebook
        configureGoogleButton.buttonSize = .large
        configureGoogleButton.cornerStyle = .large
        configureGoogleButton.background.strokeColor = .colorNumber07
        configureGoogleButton.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

        faceBookButton.configuration = configureGoogleButton
        faceBookButton.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(faceBookButton)
    }

    func stackViewSocialLoggedButton() {
        stackViewSocialButton.axis = .horizontal
        stackViewSocialButton.spacing = 10
        stackViewSocialButton.alignment = .fill
        stackViewSocialButton.distribution = .fillProportionally

        stackViewSocialButton.addArrangedSubview(googleButton)
        stackViewSocialButton.addArrangedSubview(faceBookButton)
        stackViewSocialButton.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stackViewSocialButton)
        configureConstrainSocialButton()
    }

        //MARK: Action
    @objc func loginButtonAction() {
        let viewController = HomeViewController()
        chechingData()

        if loginTextField.text == user.login && passwordTextField.text == user.password {
            viewController.user = user
            if let navigationController = self.navigationController {
                navigationController.setViewControllers([viewController], animated: true)
            }
            self.dismiss(animated: false)
        } else {
            showAlert(title: "Login Fail", message: "Enter the username or the password is incorrect, please correct and try again.") {
                self.passwordTextField.text?.removeAll()
            }
            return
        }

        func chechingData() {
            let inputName = loginTextField.text
            let inputPassword = passwordTextField.text

            let usernamePattern = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$"

            /*
             ^[a-zA-Z0-9._%+-]+: Часть до символа "@" (имя пользователя), которая может содержать буквы, цифры, точки, подчеркивания, проценты, плюс и минус.
             @: Символ "@"
             [a-zA-Z0-9.-]+: Часть после символа "@" и до точки (домен), которая может содержать буквы, цифры, точки и дефисы.
             \.: Точка (разделитель между доменом и расширением).
             [a-zA-Z]{2,}$: Расширение домена (минимум 2 буквы).
             */

            let isUsernameValid = NSPredicate(format: "SELF MATCHES %@", usernamePattern)
                .evaluate(with: inputName)

            let passwordPattern = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[\\@$!%*?&])[A-Za-z\\d@$!%*?&]{12,}$"

            /*
             (?=.*[a-z]): Хотя бы одна строчная буква.
             (?=.*[A-Z]): Хотя бы одна прописная буква.
             (?=.*\d): Хотя бы одна цифра.
             (?=.*[@$!%*?&]): Хотя бы один специальный символ из указанного набора.
             [A-Za-z\d@$!%*?&]{12,}: 12 или более символов из указанных категорий.
             */

            let isPasswordValid = NSPredicate(format: "SELF MATCHES %@", passwordPattern)
                .evaluate(with: inputPassword)

            if !isUsernameValid {
                showAlert(title: "Wrong login Format", message: "Check the entered login")
            } else if !isPasswordValid {
                showAlert(title: "Wrong password Format", message: "Check the entered password")
            }
        }
    }

    func showAlert(title: String, message: String, complition: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default) { _ in
            complition?()
        }

        alert.addAction(alertAction)
        present(alert, animated: true)
    }

    func showForgotButton() {

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

    func configureConstrainButton() {
        NSLayoutConstraint.activate([
            loginButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            loginButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            loginButton.topAnchor.constraint(equalTo: textFieldStackView.bottomAnchor, constant: 40),
            loginButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }

    func configureConstrainSeparatorStackVIew() {
        NSLayoutConstraint.activate([
            separatorStackView.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            separatorStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            separatorStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            separatorStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            separatorStackView.heightAnchor.constraint(equalToConstant: 40),
//            separatorLabel.widthAnchor.constraint(equalToConstant: 30),
            linePath.heightAnchor.constraint(equalToConstant: 0.5),
            linePathRight.heightAnchor.constraint(equalToConstant: 0.5),
            linePath.leadingAnchor.constraint(equalTo: separatorStackView.leadingAnchor),
            linePath.trailingAnchor.constraint(equalTo: separatorLabel.leadingAnchor,constant: -10),
            linePathRight.trailingAnchor.constraint(equalTo: separatorStackView.trailingAnchor),
            linePathRight.leadingAnchor.constraint(equalTo: separatorLabel.trailingAnchor, constant: 10)
        ])
    }

    func configureConstrainSocialButton() {
        NSLayoutConstraint.activate([
            stackViewSocialButton.topAnchor.constraint(equalTo: separatorStackView.bottomAnchor, constant: 30),
            stackViewSocialButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
        ])
    }



}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        true
    }
}

#Preview {
    let viewController = LoginViewController()
    viewController
}


