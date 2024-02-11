// AuthorisationViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Стартовый экран приложения
class AuthorisationViewController: UIViewController {
    // MARK: - Types

    // MARK: - Constants

    // MARK: - Visual Components

    private let logoImageView: UIImageView = {
        let logoImageView = UIImageView(frame: CGRect(x: 125, y: 70, width: 125, height: 125))
        logoImageView.image = UIImage(named: "LogoRemainder")
        logoImageView.clipsToBounds = false
        logoImageView.contentMode = .scaleAspectFit
        return logoImageView
    }()

    private let passwordImageView: UIImageView = {
        let passwordImageView = UIImageView(frame: CGRect(x: 332, y: 419, width: 22, height: 19))
        passwordImageView.image = UIImage(named: "PasswordLogo")
        passwordImageView.clipsToBounds = false
        passwordImageView.contentMode = .scaleAspectFit
        return passwordImageView
    }()

    private let titleLabel: UILabel = {
        let titleLabel = UILabel(frame: CGRect(x: 115, y: 200, width: 150, height: 44))
        titleLabel.text = "Birthday Reminder"
        titleLabel.font = .boldSystemFont(ofSize: 18)
        titleLabel.numberOfLines = 2
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor(red: 90, green: 67, blue: 148, alpha: 1.0)
        return titleLabel
    }()

    private let signLabel: UILabel = {
        let signLabel = UILabel(frame: CGRect(x: 20, y: 266, width: 175, height: 31))
        signLabel.text = "Sign in"
        signLabel.font = .boldSystemFont(ofSize: 26)
        signLabel.textColor = UIColor(red: 233, green: 70, blue: 94, alpha: 1.0)
        return signLabel
    }()

    private let emailLabel: UILabel = {
        let emailLabel = UILabel(frame: CGRect(x: 20, y: 318, width: 175, height: 19))
        emailLabel.text = "Email"
        emailLabel.font = .systemFont(ofSize: 16)
        emailLabel.textColor = UIColor(red: 233, green: 70, blue: 94, alpha: 1.0)
        return emailLabel
    }()

    private let passwordLabel: UILabel = {
        let passwordLabel = UILabel(frame: CGRect(x: 20, y: 393, width: 175, height: 19))
        passwordLabel.text = "Password"
        passwordLabel.font = .systemFont(ofSize: 16)
        passwordLabel.textColor = UIColor(red: 233, green: 70, blue: 94, alpha: 1.0)
        return passwordLabel
    }()

    private let emailTextField: UITextField = {
        let emailTextField = UITextField(frame: CGRect(x: 20, y: 347, width: 175, height: 17))
        emailTextField.placeholder = "Typing email"
        emailTextField.font = .systemFont(ofSize: 14)
        return emailTextField
    }()

    private let passwordTextField: UITextField = {
        let passwordTextField = UITextField(frame: CGRect(x: 20, y: 422, width: 175, height: 17))
        passwordTextField.placeholder = "Typing password"
        passwordTextField.font = .systemFont(ofSize: 14)
        return passwordTextField
    }()

    private let lineEmailView: UIView = {
        let lineView = UIView(frame: CGRect(x: 20, y: 372, width: 335, height: 1))
        lineView.backgroundColor = UIColor(red: 208, green: 214, blue: 220, alpha: 1.0)
        return lineView
    }()

    private let linePasswordView: UIView = {
        let lineView = UIView(frame: CGRect(x: 20, y: 448, width: 335, height: 1))
        lineView.backgroundColor = UIColor(red: 208, green: 214, blue: 220, alpha: 1.0)
        return lineView
    }()

    private let loginButton: UIButton = {
        let loginButton = UIButton(frame: CGRect(x: 20, y: 671, width: 335, height: 44))
        loginButton.layer.cornerRadius = 20
        loginButton.backgroundColor = UIColor(red: 233, green: 70, blue: 94, alpha: 0.4)
        loginButton.setTitle("Login", for: .normal)
        loginButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        loginButton.addTarget(nil, action: #selector(loginButtonTouched), for: .touchUpInside)
        return loginButton
    }()

    // MARK: - Public Properties

    // MARK: - Private Properties

    // MARK: - Initializers

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    // MARK: - Public Methods

    // MARK: - Private Methods

    private func setUI() {
        view.backgroundColor = .white
        view.addSubview(logoImageView)
        view.addSubview(signLabel)
        view.addSubview(titleLabel)
        view.addSubview(emailLabel)
        view.addSubview(passwordLabel)
        view.addSubview(emailTextField)
        view.addSubview(lineEmailView)
        view.addSubview(linePasswordView)
        view.addSubview(passwordTextField)
        view.addSubview(passwordImageView)
        view.addSubview(loginButton)
    }

    @objc private func loginButtonTouched() {
        let nextViewController = BirthdayReminderViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}
