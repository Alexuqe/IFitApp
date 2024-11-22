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

    let userNameTextField = UITextField()
    let userPasswordTextField = UITextField()

    let loginButton = UIButton()
    let forgotPasswordButton = UIButton()

    let labelStackView = UIStackView()
    let textFieldStackView = UIStackView()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true

        setupUI()
            // Do any additional setup after loading the view.
    }


}


extension LoginViewController: UITextFieldDelegate {

    func setupUI() {
        configureNameTextField()
        configurePasswordTextField()
        configureTextFieldStackView()

        configureTextFieldStackView()
    }

    func configureNameTextField() {
        userNameTextField.placeholder = "User Name"
//        userNameTextField.backgroundColor = .gray
        userNameTextField.borderStyle = .roundedRect
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(userNameTextField)
    }

    func configurePasswordTextField() {
        userPasswordTextField.placeholder = "User Password"
        userPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(userPasswordTextField)
    }

    func configureTextFieldStackView() {
        textFieldStackView.axis = .vertical
        textFieldStackView.spacing = 5
        textFieldStackView.alignment = .fill
        textFieldStackView.distribution = .fillProportionally

        textFieldStackView.addArrangedSubview(userNameTextField)
        textFieldStackView.addArrangedSubview(userPasswordTextField)

        textFieldStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textFieldStackView)

        constrainTextFieldStackView()
    }



    //MARK: Constrains

    func constrainTextFieldStackView() {
        NSLayoutConstraint.activate([
            textFieldStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            textFieldStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            textFieldStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

    }



}

#Preview {
    let viewController = LoginViewController()
    viewController
}


