// MenuViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран выбора разных светофоров
final class MenuViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let storyboardTitle = "Storyboard"
        static let layoutAnchorTitle = "NSLayoutAnchor"
        static let stackViewTitle = "StackView"
        static let storyboardViewControllerTitle = "StoryboardViewController"
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }

    // MARK: - Private Methods

    private func configureUI() {
        view.backgroundColor = .white
        let firstLightButton = UIButton(frame: CGRect(x: 50, y: 100, width: 200, height: 50))
        firstLightButton.setTitle(Constants.storyboardTitle, for: .normal)
        firstLightButton.backgroundColor = .lightGray
        firstLightButton.addTarget(self, action: #selector(firstLightButtonTapped), for: .touchUpInside)
        view.addSubview(firstLightButton)

        let secondLightButton = UIButton(frame: CGRect(x: 50, y: 200, width: 200, height: 50))
        secondLightButton.setTitle(Constants.layoutAnchorTitle, for: .normal)
        secondLightButton.backgroundColor = .lightGray
        secondLightButton.addTarget(self, action: #selector(secondLightButtonTapped), for: .touchUpInside)
        view.addSubview(secondLightButton)

        let thridLightButton = UIButton(frame: CGRect(x: 50, y: 300, width: 200, height: 50))
        thridLightButton.setTitle(Constants.stackViewTitle, for: .normal)
        thridLightButton.backgroundColor = .lightGray
        thridLightButton.addTarget(self, action: #selector(thridLightButtonTapped), for: .touchUpInside)
        view.addSubview(thridLightButton)
    }

    @objc private func firstLightButtonTapped() {
        let storyboard = UIStoryboard(name: Constants.storyboardViewControllerTitle, bundle: nil)
        guard let storyboardViewController = storyboard.instantiateViewController(
            withIdentifier: Constants.storyboardViewControllerTitle
        ) as? StoryboardViewController else { return }
        present(storyboardViewController, animated: false, completion: nil)
    }

    @objc private func secondLightButtonTapped() {
        let anchorLightViewController = AnchorLightViewController()
        navigationController?.pushViewController(anchorLightViewController, animated: true)
    }

    @objc private func thridLightButtonTapped() {
        let stackViewLightViewController = StackViewLightViewController()
        navigationController?.pushViewController(stackViewLightViewController, animated: true)
    }
}
