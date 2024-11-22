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
        configureEmailTextField()
        configurePasswordTextField()
        configureTextFieldStackView()

        configureTextFieldStackView()
    }

    func configureEmailTextField() {
        emailTextField.placeholder = "Email"
        emailTextField.font = UIFont(name: "Poppins-Regular", size: 18)
        emailTextField.adjustsFontSizeToFitWidth = true
        emailTextField.minimumFontSize = 12
        emailTextField.sizingRule = .typographic
        emailTextField.textAlignment = .left
        emailTextField.autocapitalizationType = .none
        emailTextField.keyboardType = .emailAddress


        let leftPadding = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: emailTextField.bounds.height + 15))
        emailTextField.leftView = leftPadding
        emailTextField.leftViewMode = .always

        emailTextField.layer.borderWidth = 0.8
        emailTextField.layer.cornerRadius = 5
        emailTextField.layer.borderColor = UIColor.colorNumber06.cgColor

        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emailTextField)
        
        emailTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
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

        textFieldStackView.addArrangedSubview(emailTextField)
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

//#Preview {
//    let viewController = LoginViewController()
//    viewController
//}


