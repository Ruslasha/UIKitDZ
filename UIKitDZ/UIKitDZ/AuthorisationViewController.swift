// AuthorisationViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Программное изменение экрана авторизации
final class AuthorisationViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet var login: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var enterButton: UIButton!

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setAuthorizationFields()
    }

    // MARK: - Private Methods

    private func setAuthorizationFields() {
        password.isSecureTextEntry = true
        login.addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)
        password.addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)
    }

    @objc private func textDidChange(_ textField: UITextField) {
        guard let loginText = login.text,
              let passwordText = password.text
        else {
            return
        }
        enterButton.alpha = !loginText.isEmpty && !passwordText.isEmpty ? 1.0 : 0.5
    }
}
