//
//  PasswordTextField.swift
//  IFitApp
//
//  Created by Sasha on 26.11.24.
//

import UIKit

class PasswordTextField: UITextField {

    let rightImageTextField = UIImageView()
    let passwordTF = UITextField()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configurePasswordTextField()
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")

    }

    func configurePasswordTextField() {
        self.placeholder = "Password"
        self.font = UIFont().fontRegularStyle(size: 18)
        self.minimumFontSize = 12
        self.textAlignment = .left
        self.autocapitalizationType = .none
        self.autocorrectionType = .no
        self.adjustsFontSizeToFitWidth = true

        self.layer.borderWidth = 0.8
        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor.colorNumber08.cgColor

        self.sizingRule = .typographic
        self.keyboardType = .decimalPad
        self.isSecureTextEntry = false

        let leftImageTF = UIImageView()
        leftImageTF.image = UIImage(named: "iconlyLightLock")
        leftImageTF.tintColor = .colorNumber05
        leftImageTF.contentMode = .center
        leftImageTF.translatesAutoresizingMaskIntoConstraints = false
        self.leftView = leftImageTF
        self.leftView?.widthAnchor.constraint(equalToConstant: 50).isActive = true
        self.leftViewMode = .always
        self.clearButtonMode = .whileEditing

        let rigtImageTF = rightImageTextField
        rigtImageTF.image = UIImage(named: "iconlyLightShow")
        rigtImageTF.tintColor = .colorNumber05
        rigtImageTF.contentMode = .center
        rigtImageTF.translatesAutoresizingMaskIntoConstraints = false
        rigtImageTF.isUserInteractionEnabled = true
        self.rightView = rigtImageTF
        self.rightViewMode = .always
        self.rightView?.widthAnchor.constraint(equalToConstant: 50).isActive = true

        let tappedEye = UITapGestureRecognizer(target: self, action: #selector(tappedOnEye))
        rigtImageTF.addGestureRecognizer(tappedEye)


        self.translatesAutoresizingMaskIntoConstraints = false

        self.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

    @objc func tappedOnEye(tapGestureRecognizer: UITapGestureRecognizer) {
        self.isSecureTextEntry.toggle()

        switch self.isSecureTextEntry {
            case true:
                rightImageTextField.image = UIImage(named: "iconlyLightHide")
            case false:
                rightImageTextField.image = UIImage(named: "iconlyLightShow")
        }

        self.resignFirstResponder()
        self.becomeFirstResponder()
    }


}
