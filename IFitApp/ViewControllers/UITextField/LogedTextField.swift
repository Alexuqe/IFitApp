//
//  LogedTextField.swift
//  IFitApp
//
//  Created by Sasha on 26.11.24.
//

import UIKit

class LogedTextField: UITextField {

    let rightImageTextField = UIImageView()
    let passwordTF = UITextField()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureEmailTextField()
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
//        configureEmailTextField()
    }

    func configureEmailTextField() {
        self.placeholder = "Email"
        self.font = UIFont().fontRegularStyle(size: 18)
        self.adjustsFontSizeToFitWidth = true
        self.minimumFontSize = 12
        self.sizingRule = .typographic
        self.textAlignment = .left
        self.autocapitalizationType = .none
        self.keyboardType = .emailAddress

        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 40).isActive = true

        let imageTF = UIImageView()
        imageTF.image = UIImage(named: "iconlyLightMessage")
        imageTF.tintColor = .colorNumber05
        imageTF.contentMode = .center
        imageTF.translatesAutoresizingMaskIntoConstraints = false
        self.leftView = imageTF
        self.leftView?.widthAnchor.constraint(equalToConstant: 50).isActive = true
        self.leftViewMode = .always
        self.layer.borderWidth = 0.8
        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor.colorNumber08.cgColor

        let rightImageEmailTextField = UIImageView()
        let rightImageTf = rightImageEmailTextField
        rightImageTf.image = UIImage(systemName: "delete.backward")
        rightImageTf.tintColor = .colorNumber05
        rightImageTf.contentMode = .center
        rightImageTf.translatesAutoresizingMaskIntoConstraints = false
        rightImageTf.isUserInteractionEnabled = true

        self.rightView = rightImageTf
        self.rightViewMode = .whileEditing
        self.rightView?.widthAnchor.constraint(equalToConstant: 50).isActive = true

        let delete = UITapGestureRecognizer(target: self, action: #selector(deleteText))
        rightImageTf.addGestureRecognizer(delete)

    }

    @objc func deleteText(tapGestureRecognizer: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.98, delay: 0, options: .curveLinear) {
        } completion: { _ in
            let endPosition = self.endOfDocument
            self.selectedTextRange = self.textRange(from: endPosition, to: endPosition)
            self.text = ""
            self.rightView?.removeFromSuperview()
        }
    }



}
