// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Главный экран приложения
final class ViewController: UIViewController {
    // MARK: - Private Properties

    private var resultNumber = 0.0
    
    private var nameLabel: UILabel {
        let nameLabel = UILabel()
        nameLabel.font = UIFont.systemFont(ofSize: 18)
        nameLabel.textAlignment = .center
        nameLabel.frame = CGRect(x: 0, y: 100, width: view.frame.width, height: 50)
        return nameLabel
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addWelcomeAlert()
    }

    // MARK: - Private Methods

    private func setView() {
        addACalculateButton()
        addGuessButton()
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Background")
        backgroundImage.contentMode = .scaleAspectFill
        view.backgroundColor = .white
        view.insertSubview(backgroundImage, at: 0)
    }

    private func addACalculateButton() {
        let additionButton = UIButton()
        additionButton.setTitle("Сложение", for: .normal)
        additionButton.backgroundColor = UIColor(red: 100 / 255, green: 181 / 255, blue: 130 / 255, alpha: 1)
        additionButton.tintColor = .white
        additionButton.layer.cornerRadius = 20
        additionButton.layer.borderWidth = 3.0
        additionButton.layer.borderColor = UIColor(red: 59 / 255, green: 105 / 255, blue: 76 / 255, alpha: 1).cgColor
        additionButton.frame = CGRect(
            x: view.center.x - 50,
            y: view.center.y + 50,
            width: 200,
            height: 200
        )
        additionButton.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)

        view.addSubview(additionButton)
    }

    private func addGuessButton() {
        let guessButton = UIButton()
        guessButton.setTitle("Угадай число", for: .normal)
        guessButton.backgroundColor = UIColor(red: 155 / 255, green: 127 / 255, blue: 181 / 255, alpha: 1)
        guessButton.tintColor = .white
        guessButton.layer.cornerRadius = 10
        guessButton.layer.borderWidth = 3.0
        guessButton.layer.borderColor = UIColor.purple.cgColor
        guessButton.frame = CGRect(
            x: view.center.x - 150,
            y: view.center.y - 150,
            width: 150,
            height: 150
        )
        guessButton.addTarget(self, action: #selector(guessButtonTapped), for: .touchUpInside)
        view.addSubview(guessButton)
    }

    private func checkNumber(_ number: Int) {
        let randomNumber = Int.random(in: 1 ... 10)
        if number == randomNumber {
            let resultAlertController = UIAlertController(
                title: "Поздравляю!",
                message: "Вы угадали",
                preferredStyle: .alert
            )
            let okAction = UIAlertAction(title: "OK", style: .default)
            resultAlertController.addAction(okAction)
            present(resultAlertController, animated: true, completion: nil)
        } else {
            let resultAlertController = UIAlertController(
                title: "Упс!",
                message: "Это неверный ответ",
                preferredStyle: .alert
            )
            let okAction = UIAlertAction(title: "OK", style: .default)
            resultAlertController.addAction(okAction)
            present(resultAlertController, animated: true, completion: nil)
        }
    }

    private func selectOperationNumber(firstNumber: Double, secondNumber: Double) {
        let operationAlertController = UIAlertController(
            title: "Выберите операцию",
            message: nil,
            preferredStyle: .alert
        )

        let additionAction = UIAlertAction(title: "Сложить", style: .default) { _ in
            self.resultNumber = firstNumber + secondNumber
            self.outResult(self.resultNumber)
        }
        let subtractionAction = UIAlertAction(title: "Вычесть", style: .default) { _ in
            self.resultNumber = firstNumber - secondNumber
            self.outResult(self.resultNumber)
        }
        let multiplicationAction = UIAlertAction(title: "Умножить", style: .default) { _ in
            self.resultNumber = firstNumber * secondNumber
            self.outResult(self.resultNumber)
        }
        let divisionAction = UIAlertAction(title: "Разделить", style: .default) { _ in
            if secondNumber != 0 {
                self.resultNumber = firstNumber / secondNumber
                self.outResult(self.resultNumber)
            }
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)

        operationAlertController.addAction(additionAction)
        operationAlertController.addAction(subtractionAction)
        operationAlertController.addAction(multiplicationAction)
        operationAlertController.addAction(divisionAction)
        operationAlertController.addAction(cancelAction)

        present(operationAlertController, animated: true, completion: nil)
    }

    private func outResult(_ resultNumber: Double) {
        let resultAlertController = UIAlertController(
            title: "Ваш результат",
            message: "\(resultNumber)",
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default)
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        resultAlertController.addAction(okAction)
        resultAlertController.addAction(cancelAction)
        present(resultAlertController, animated: true, completion: nil)
    }

    private func addWelcomeAlert() {
        let alertController = UIAlertController(
            title: "Пожалуйста, представьтесь",
            message: "",
            preferredStyle:
            .alert
        )
        let action = UIAlertAction(title: "Готово", style: .default) { _ in
            if let text = alertController.textFields?.first?.text {
                let label = UILabel()
                label.text = "Приветствую, \n\(text)!"
                label.textColor = .white
                label.numberOfLines = 0
                label.font = UIFont.systemFont(ofSize: 30)
                label.backgroundColor = UIColor(red: 151 / 255, green: 203 / 255, blue: 229 / 255, alpha: 1)
                label.layer.borderWidth = 3.0
                label.layer.borderColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.8).cgColor
                label.textAlignment = .center
                label.frame = CGRect(x: 0, y: 30, width: self.view.frame.width, height: 100)
                self.view.addSubview(label)
            }
        }
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }

    @objc func guessButtonTapped() {
        let alertController = UIAlertController(
            title: "Угадай число от 1 до 10",
            message: "",
            preferredStyle:
            .alert
        )
        alertController.addTextField(configurationHandler: nil)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            guard let firstText = alertController.textFields?[0].text
            else {
                return
            }
            self.checkNumber(Int(firstText) ?? 0)
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }

    @objc func calculateButtonTapped() {
        let alertController = UIAlertController(
            title: "Введите ваши числа",
            message: "",
            preferredStyle:
            .alert
        )
        let action = UIAlertAction(title: "Выбрать операцию", style: .default) { _ in
            guard let firstText = alertController.textFields?[0].text,
                  let secondText = alertController.textFields?[1].text
            else {
                return
            }
            self.selectOperationNumber(firstNumber: Double(firstText) ?? 0, secondNumber: Double(secondText) ?? 0)
        }
        alertController.addTextField(configurationHandler: nil)
        alertController.addTextField(configurationHandler: nil)
        guard let firstTextField = alertController.textFields?[0],
              let secondTextField = alertController.textFields?[1]
        else {
            return
        }
        firstTextField.placeholder = "Число 1"
        secondTextField.placeholder = "Число 2"
        alertController.addAction(action)
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }
}
