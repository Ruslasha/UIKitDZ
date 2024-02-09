// GuessNumberView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Вью главного экрана
final class GuessNumberView: UIView {
    // MARK: - Constants

    let labelReversed: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 812 - 400, width: 375, height: 50))
        label.textAlignment = .center
        return label
    }()

    let labelReversedName: UILabel = {
        let labelReversedName = UILabel(frame: CGRect(x: 0, y: 812 - 450, width: 375, height: 50))
        labelReversedName.textAlignment = .center
        labelReversedName.text = "А вот что получится, если читать справа налево"
        labelReversedName.numberOfLines = 0
        labelReversedName.font = .systemFont(ofSize: 16, weight: .bold)
        return labelReversedName
    }()

    let labelInputName: UILabel = {
        let labelInputName = UILabel(frame: CGRect(x: 0, y: 812 - 650, width: 375, height: 50))
        labelInputName.textAlignment = .center
        labelInputName.text = "Вы ввели слово"
        labelInputName.numberOfLines = 0
        labelInputName.font = .systemFont(ofSize: 16, weight: .bold)
        return labelInputName
    }()

    let labelInput: UILabel = {
        let labelInput = UILabel(frame: CGRect(x: 0, y: 812 - 600, width: 375, height: 50))
        labelInput.textAlignment = .center
        labelInput.numberOfLines = 0
        return labelInput
    }()

    let startButton: UIButton = {
        let startButton = UIButton()
        startButton.setTitle("Начать", for: .normal)
        startButton.frame = CGRect(x: 375 / 2 - 100, y: 812 - 200, width: 200, height: 50)
        startButton.layer.cornerRadius = 10
        startButton.backgroundColor = UIColor.green
        startButton.setTitleColor(UIColor.white, for: .normal)
        return startButton
    }()

    // MARK: - Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func setUI() {
        backgroundColor = .white
        addSubview(labelReversed)
        addSubview(labelReversedName)
        addSubview(labelInputName)
        addSubview(labelInput)
        addSubview(startButton)
    }
}
