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

    let emailTextField = UITextField()
    let passwordTextField = UITextField()

    let loginButton = UIButton()
    let forgotPasswordButton = UIButton()

    let labelStackView = UIStackView()
    let textFieldStackView = UIStackView()

    let rightImageTextField = UIImageView()
    let rightImageEmailTextField = UIImageView()



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

        configureEmailTextField()
        configurePasswordTextField()

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

    func configureEmailTextField() {
        emailTextField.placeholder = "Email"
        emailTextField.font = UIFont().fontRegularStyle(size: 18)
        emailTextField.adjustsFontSizeToFitWidth = true
        emailTextField.minimumFontSize = 12
        emailTextField.sizingRule = .typographic
        emailTextField.textAlignment = .left
        emailTextField.autocapitalizationType = .none
        emailTextField.keyboardType = .emailAddress


        let imageTF = UIImageView()
        imageTF.image = UIImage(named: "iconlyLightMessage")
        imageTF.tintColor = .colorNumber05
        imageTF.contentMode = .center
        imageTF.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.leftView = imageTF
        emailTextField.leftView?.widthAnchor.constraint(equalToConstant: 50).isActive = true
        emailTextField.leftViewMode = .always
        emailTextField.layer.borderWidth = 0.8
        emailTextField.layer.cornerRadius = 5
        emailTextField.layer.borderColor = UIColor.colorNumber08.cgColor


        let rightImageTf = rightImageEmailTextField
        rightImageTf.image = UIImage(systemName: "delete.backward")
        rightImageTf.tintColor = .colorNumber05
        rightImageTf.contentMode = .center
        rightImageTf.translatesAutoresizingMaskIntoConstraints = false
        rightImageTf.isUserInteractionEnabled = true

        emailTextField.rightView = rightImageTf
        emailTextField.rightViewMode = .whileEditing
        emailTextField.rightView?.widthAnchor.constraint(equalToConstant: 50).isActive = true

        let delete = UITapGestureRecognizer(target: self, action: #selector(deleteText))
        rightImageTf.addGestureRecognizer(delete)


        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emailTextField)

        emailTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

    @objc func deleteText(tapGestureRecognizer: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.98, delay: 0, options: .curveLinear) {
        } completion: { _ in
            let endPosition = self.emailTextField.endOfDocument
            self.emailTextField.selectedTextRange = self.emailTextField.textRange(from: endPosition, to: endPosition)
            self.emailTextField.text = ""

            self.emailTextField.rightView?.removeFromSuperview()
        }
    }



    func configurePasswordTextField() {
        passwordTextField.placeholder = "Password"
        passwordTextField.font = UIFont().fontRegularStyle(size: 18)
        passwordTextField.minimumFontSize = 12
        passwordTextField.textAlignment = .left
        passwordTextField.autocapitalizationType = .none
        passwordTextField.adjustsFontSizeToFitWidth = true

        passwordTextField.layer.borderWidth = 0.8
        passwordTextField.layer.cornerRadius = 5
        passwordTextField.layer.borderColor = UIColor.colorNumber08.cgColor

        passwordTextField.sizingRule = .typographic
        passwordTextField.keyboardType = .decimalPad
        passwordTextField.isSecureTextEntry = false

        let leftImageTF = UIImageView()
        leftImageTF.image = UIImage(named: "iconlyLightLock")
        leftImageTF.tintColor = .colorNumber05
        leftImageTF.contentMode = .center
        leftImageTF.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.leftView = leftImageTF
        passwordTextField.leftView?.widthAnchor.constraint(equalToConstant: 50).isActive = true
        passwordTextField.leftViewMode = .always

        let rigtImageTF = rightImageTextField
        rigtImageTF.tintColor = .colorNumber05
        rigtImageTF.contentMode = .center
        rigtImageTF.translatesAutoresizingMaskIntoConstraints = false
        rigtImageTF.isUserInteractionEnabled = true
        passwordTextField.rightView = rigtImageTF
        passwordTextField.rightViewMode = .always
        passwordTextField.rightView?.widthAnchor.constraint(equalToConstant: 50).isActive = true

        let tappedEye = UITapGestureRecognizer(target: self, action: #selector(tappedOnEye))
        rigtImageTF.addGestureRecognizer(tappedEye)


        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordTextField)

        passwordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

    @objc func tappedOnEye(tapGestureRecognizer: UITapGestureRecognizer) {
        passwordTextField.isSecureTextEntry.toggle()

        switch passwordTextField.isSecureTextEntry {
            case true:
                rightImageTextField.image = UIImage(named: "iconlyLightHide")
            case false:
                rightImageTextField.image = UIImage(named: "iconlyLightShow")
        }

        passwordTextField.resignFirstResponder()
        passwordTextField.becomeFirstResponder()
    }


    func configureTextFieldStackView() {
        textFieldStackView.axis = .vertical
        textFieldStackView.spacing = 15
        textFieldStackView.alignment = .fill
        textFieldStackView.distribution = .fillProportionally

        textFieldStackView.addArrangedSubview(emailTextField)
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
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        false
    }
}

#Preview {
    let viewController = LoginViewController()
    viewController
}


