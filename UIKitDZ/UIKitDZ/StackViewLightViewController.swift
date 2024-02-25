// StackViewLightViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран светофора со stackview
final class StackViewLightViewController: UIViewController {
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }

    // MARK: - Private Methods

    private func configureUI() {
        view.backgroundColor = .white

        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 2
        stackView.layoutMargins = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        stackView.isLayoutMarginsRelativeArrangement = true

        let redView = UIView()
        redView.backgroundColor = .red

        let yellowView = UIView()
        yellowView.backgroundColor = .yellow

        let greenView = UIView()
        greenView.backgroundColor = .green

        stackView.addArrangedSubview(redView)
        stackView.addArrangedSubview(yellowView)
        stackView.addArrangedSubview(greenView)

        view.addSubview(stackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .black
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.70),
            stackView.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.20)
        ])
    }
}
