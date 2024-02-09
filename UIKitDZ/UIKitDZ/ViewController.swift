// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ViewController
final class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var login: UITextField!
    @IBOutlet var password: UITextField!

    @IBOutlet var enterButton: UIButton!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        password.isSecureTextEntry = true
        login.addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)
        password.addTarget(self, action: #selector(textDidChange(_:)), for: .editingChanged)
    }

    // MARK: - Private Methods
    @objc func textDidChange(_ textField: UITextField) {
        guard let loginText = login.text,
              let passwordText = password.text
        else {
            return
        }
        let isLoginFilled = !loginText.isEmpty
        let isPasswordFilled = !passwordText.isEmpty

        enterButton.alpha = isLoginFilled && isPasswordFilled ? 1.0 : 0.5
    }
}
