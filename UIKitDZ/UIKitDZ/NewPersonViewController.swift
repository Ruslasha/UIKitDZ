// NewPersonViewController.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit

/// Экран добавления нового человека
class NewPersonViewController: UIViewController {
    // MARK: - Visual Components

    private let cancelButton: UIButton = {
        let cancelButton = UIButton(type: .system)
        cancelButton.frame = CGRect(x: 20, y: 15, width: 50, height: 20)
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.addTarget(nil, action: #selector(cancelButtonTapped), for: .touchUpInside)
        return cancelButton
    }()

    private let addButton: UIButton = {
        let addButton = UIButton(type: .system)
        addButton.frame = CGRect(x: 325, y: 15, width: 30, height: 20)
        addButton.setTitle("Add", for: .normal)
        addButton.addTarget(nil, action: #selector(addButtonTapped), for: .touchUpInside)
        return addButton
    }()

    private let changePhotoButton: UIButton = {
        let changePhotoButton = UIButton(type: .system)
        changePhotoButton.frame = CGRect(x: 125, y: 199, width: 125, height: 20)
        changePhotoButton.setTitle("Change photo", for: .normal)
        return changePhotoButton
    }()

    private let selectPhotoImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 125, y: 66, width: 125, height: 125))
        imageView.image = UIImage(named: "SelectPhoto")
        imageView.clipsToBounds = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let nameLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 239, width: 175, height: 20))
        label.text = "Name Surname"
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()

    private let lineNameView: UIView = {
        let lineView = UIView(frame: CGRect(x: 20, y: 293, width: 335, height: 1))
        lineView.backgroundColor = UIColor(red: 208, green: 214, blue: 220, alpha: 1.0)
        return lineView
    }()

    private let birthdayLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 314, width: 175, height: 20))
        label.text = "Birthday"
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()

    private let lineBirthdayView: UIView = {
        let lineView = UIView(frame: CGRect(x: 20, y: 368, width: 335, height: 1))
        lineView.backgroundColor = UIColor(red: 208, green: 214, blue: 220, alpha: 1.0)
        return lineView
    }()

    private let ageLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 389, width: 175, height: 20))
        label.text = "Age"
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()

    private let lineAgeView: UIView = {
        let lineView = UIView(frame: CGRect(x: 20, y: 443, width: 335, height: 1))
        lineView.backgroundColor = UIColor(red: 208, green: 214, blue: 220, alpha: 1.0)
        return lineView
    }()

    private let genderLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 462, width: 175, height: 20))
        label.text = "Gender"
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()

    private let lineGenderView: UIView = {
        let lineView = UIView(frame: CGRect(x: 20, y: 516, width: 335, height: 1))
        lineView.backgroundColor = UIColor(red: 208, green: 214, blue: 220, alpha: 1.0)
        return lineView
    }()

    private let telegramLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 537, width: 175, height: 20))
        label.text = "Telegram"
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()

    private let lineTelegramView: UIView = {
        let lineView = UIView(frame: CGRect(x: 20, y: 591, width: 335, height: 1))
        lineView.backgroundColor = UIColor(red: 208, green: 214, blue: 220, alpha: 1.0)
        return lineView
    }()

    private let nameTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 268, width: 250, height: 17))
        textField.placeholder = "Typing Name Surname"
        textField.font = .systemFont(ofSize: 14)
        return textField
    }()

    private lazy var birthdayTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 343, width: 250, height: 17))
        textField.placeholder = "Typing Date of Birth"
        textField.font = .systemFont(ofSize: 14)
        textField.delegate = self
        return textField
    }()

    private let birthdayDatePickerView: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .wheels
        return picker
    }()

    private lazy var ageTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 418, width: 250, height: 17))
        textField.placeholder = "Typing age"
        textField.font = .systemFont(ofSize: 14)
        textField.delegate = self
        textField.inputView = agePickerView
        return textField
    }()

    private let agePickerView: UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()

    private lazy var genderTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 491, width: 250, height: 17))
        textField.placeholder = "Indicate Gender"
        textField.font = .systemFont(ofSize: 14)
        textField.delegate = self
        textField.inputView = genderPickerView
        return textField
    }()

    private let genderPickerView: UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()

    private lazy var telegramTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 566, width: 250, height: 17))
        textField.placeholder = "Typing Telegram"
        textField.font = .systemFont(ofSize: 14)
        textField.addTarget(nil, action: #selector(textFieldTapped), for: .editingDidBegin)
        return textField
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    // MARK: - Private Methods

    private func setUI() {
        view.backgroundColor = .white
        view.addSubview(cancelButton)
        view.addSubview(addButton)
        view.addSubview(selectPhotoImageView)
        view.addSubview(changePhotoButton)
        view.addSubview(nameLabel)
        view.addSubview(birthdayLabel)
        view.addSubview(ageLabel)
        view.addSubview(genderLabel)
        view.addSubview(telegramLabel)
        view.addSubview(lineAgeView)
        view.addSubview(lineNameView)
        view.addSubview(lineGenderView)
        view.addSubview(lineBirthdayView)
        view.addSubview(lineTelegramView)
        view.addSubview(nameTextField)
        view.addSubview(birthdayTextField)
        view.addSubview(ageTextField)
        view.addSubview(genderTextField)
        view.addSubview(telegramTextField)
        birthdayTextField.inputView = birthdayDatePickerView
        agePickerView.dataSource = self
        agePickerView.delegate = self
        genderPickerView.dataSource = self
        genderPickerView.delegate = self
    }

    @objc private func textFieldTapped() {
        let alertController = UIAlertController(title: "Please enter Telegram", message: nil, preferredStyle: .alert)

        alertController.addTextField { textField in
            textField.placeholder = "Typing Telegram"
        }

        let okAction = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
            if let text = alertController.textFields?.first?.text {
                self?.telegramTextField.text = text
            }
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }

    @objc private func cancelButtonTapped() {
        dismiss(animated: true, completion: nil)
    }

    @objc private func addButtonTapped() {}
}

/// Расширение делегата UITextFieldDelegate для NewPersonViewController
extension NewPersonViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        birthdayDatePickerView.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
    }

    @objc func datePickerValueChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let selectedDate = sender.date
        birthdayTextField.text = dateFormatter.string(from: selectedDate)
    }
}

/// Расширение делегатов UIPickerViewDelegate и UIPickerViewDataSource для NewPersonViewController
extension NewPersonViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == agePickerView {
            return 100
        } else if pickerView == genderPickerView {
            return 2
        } else {
            return 0
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == agePickerView {
            return "\(row + 1)"
        } else if pickerView == genderPickerView {
            if row == 0 {
                return "male"
            } else {
                return "female"
            }
        } else {
            return nil
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == agePickerView {
            let selectedAge = row + 1
            ageTextField.text = "\(selectedAge)"
        } else if pickerView == genderPickerView {
            if row == 0 {
                genderTextField.text = "male"
            } else {
                genderTextField.text = "female"
            }
        }
    }
}
