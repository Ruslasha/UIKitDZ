// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ViewController
class ViewController: UIViewController {
    var label: UILabel!
    var labelReversedName: UILabel!
    var labelInputName: UILabel!

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
        label = UILabel(frame: CGRect(x: 0, y: view.bounds.maxY - 400, width: view.frame.width, height: 50))
        label.textAlignment = .center
        view.addSubview(label)

        labelReversedName = UILabel(frame: CGRect(x: 0, y: view.bounds.maxY - 450, width: view.frame.width, height: 50))
        labelReversedName.textAlignment = .center
        labelReversedName.text = "А вот что получится, если читать справа налево"
        labelReversedName.numberOfLines = 0
        labelReversedName.font = .systemFont(ofSize: 16, weight: .bold)
        view.addSubview(labelReversedName)

        labelInputName = UILabel(frame: CGRect(x: 0, y: view.bounds.maxY - 650, width: view.frame.width, height: 50))
        labelInputName.textAlignment = .center
        labelInputName.text = "Вы ввели слово"
        labelInputName.numberOfLines = 0
        labelInputName.font = .systemFont(ofSize: 16, weight: .bold)
        view.addSubview(labelInputName)
    }

    func createButtonStart() {
        let startButton = UIButton()
        startButton.setTitle("Начать", for: .normal)
        startButton.frame = CGRect(x: view.center.x - 100, y: view.bounds.maxY - 200, width: 200, height: 50)
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
