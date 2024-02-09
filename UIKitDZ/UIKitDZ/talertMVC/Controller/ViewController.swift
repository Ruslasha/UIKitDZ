// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Controller
final class ViewController: UIViewController {
    // MARK: - Private Properties

    private let guessNumberView = GuessNumberView()

    // MARK: - Life Cycle

    override func loadView() {
        view = guessNumberView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        guessNumberView.startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
    }

    // MARK: - Private Methods

    private func showAlert() {
        let alert = UIAlertController(title: "Введите слово", message: nil, preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Фраза"
        }
        let okAction = UIAlertAction(title: "ОК", style: .default) { _ in
            if let inputText = alert.textFields?.first?.text {
                let result = self.reverseString(inputText)
                self.guessNumberView.labelInput.text = inputText
                self.guessNumberView.label.text = result
            }
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }

    private func reverseString(_ input: String) -> String {
        String(input.reversed())
    }

    @objc func startButtonTapped() {
        showAlert()
    }
}
