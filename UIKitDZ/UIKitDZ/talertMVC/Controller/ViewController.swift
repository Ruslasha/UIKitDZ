// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ViewController
class ViewController: UIViewController {
    var label: UILabel!

    private var phrases = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        createLabel()
        createButtonStart()
        setViewSettings()
    }

    func setViewSettings() {
        view.backgroundColor = .white
    }

    func createLabel() {
        label = UILabel(frame: CGRect(x: 100, y: 300, width: 200, height: 50))
        label.textAlignment = .center
        view.addSubview(label)
    }

    func createButtonStart() {
        let startButton = UIButton(type: .system)
        startButton.setTitle("Начать", for: .normal)
        startButton.frame = CGRect(x: 100, y: 200, width: 200, height: 50)
        startButton.layer.cornerRadius = 10
        startButton.backgroundColor = UIColor.green
        startButton.setTitleColor(UIColor.white, for: .normal)
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        view.addSubview(startButton)
    }

    @objc func startButtonTapped() {
        showAlert()
    }

    func showAlert() {
        let alert = UIAlertController(title: "Введите слово", message: nil, preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Фраза"
        }
        let okAction = UIAlertAction(title: "ОК", style: .default) { _ in
            if let inputText = alert.textFields?.first?.text {
                let result = self.reverseString(inputText)
                self.label.text = result
            }
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }

    func reverseString(_ input: String) -> String {
        String(input.reversed())
    }
}
