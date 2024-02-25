// AnchorLightViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран светофора на anchor
final class AnchorLightViewController: UIViewController {
    // MARK: - Visual Components

    private var redView: UIView!
    private var yellowView: UIView!
    private var greenView: UIView!

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }

    // MARK: - Private Methods

    private func setConstraint(_ backgroundView: UIView) {
        NSLayoutConstraint.activate([
            backgroundView.leadingAnchor.constraint(equalTo: redView.leadingAnchor, constant: -1),
            backgroundView.trailingAnchor.constraint(equalTo: redView.trailingAnchor, constant: 1),
            backgroundView.topAnchor.constraint(equalTo: redView.topAnchor, constant: -1),
            backgroundView.bottomAnchor.constraint(equalTo: greenView.bottomAnchor, constant: 1)
        ])

        NSLayoutConstraint.activate([
            redView.leadingAnchor.constraint(equalTo: yellowView.leadingAnchor),
            redView.bottomAnchor.constraint(equalTo: yellowView.topAnchor, constant: -1),
            redView.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.20),
            redView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.20)
        ])

        NSLayoutConstraint.activate([
            yellowView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            yellowView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            yellowView.widthAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.20),
            yellowView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.20)
        ])

        NSLayoutConstraint.activate([
            greenView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            greenView.topAnchor.constraint(equalTo: yellowView.bottomAnchor, constant: 1),
            greenView.widthAnchor.constraint(equalTo: redView.widthAnchor),
            greenView.heightAnchor.constraint(equalTo: redView.heightAnchor)
        ])
    }

    private func configureUI() {
        view.backgroundColor = .white
        let backgroundView = UIView()
        backgroundView.backgroundColor = .black
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundView)

        redView = UIView()
        redView.backgroundColor = .red
        redView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(redView)

        yellowView = UIView()
        yellowView.backgroundColor = .yellow
        yellowView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(yellowView)

        greenView = UIView()
        greenView.backgroundColor = .green
        greenView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(greenView)

        setConstraint(backgroundView)
    }
}
