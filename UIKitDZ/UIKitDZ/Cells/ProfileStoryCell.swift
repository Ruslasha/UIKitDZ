// ProfileStoryCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка таблицы с историями
final class ProfileStoryCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let userPhoto = "userPhoto"
        static let firstStoryTitle = "Запуск"
        static let secondStoryTitle = "Луна"
        static let thridStoryTitle = "Космонавт"
        static let fourStoryTitle = "Космос"
        static let fiveStoryTitle = "Запуск"
        static let firstStoryPhoto = "firstStoryPhoto"
        static let secondStoryPhoto = "secondStoryPhoto"
        static let thridStoryPhoto = "thridStoryPhoto"
        static let fourStoryPhoto = "fourStoryPhoto"
        static let fiveStoryPhoto = "firstStoryPhoto"
        static let verdanaBold18 = UIFont(name: "Verdana-Bold", size: 18)
        static let verdanaBold16 = UIFont(name: "Verdana-Bold", size: 16)
        static let verdanaBold26 = UIFont(name: "Verdana-Bold", size: 26)
        static let verdanaBold12 = UIFont(name: "Verdana-Bold", size: 12)
        static let verdanaBold10 = UIFont(name: "Verdana-Bold", size: 10)
        static let verdanaBold14 = UIFont(name: "Verdana-Bold", size: 14)
        static let verdana16 = UIFont(name: "Verdana", size: 16)
        static let verdana14 = UIFont(name: "Verdana", size: 14)
        static let verdana12 = UIFont(name: "Verdana", size: 12)
        static let verdana10 = UIFont(name: "Verdana", size: 10)
        static let verdana8 = UIFont(name: "Verdana", size: 8)
    }

    // MARK: - Visual Components

    private let insideView: UIView = .init()

    private let firstStoryPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.firstStoryPhoto)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let firstStoryLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.firstStoryTitle
        label.font = Constants.verdana8
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let secondStoryPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.secondStoryPhoto)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let secondStoryLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.secondStoryTitle
        label.font = Constants.verdana8
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let thridStoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.thridStoryPhoto)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let thridStoryLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.thridStoryTitle
        label.font = Constants.verdana8
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let fourStoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.fourStoryPhoto)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let fourStoryLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.fourStoryTitle
        label.font = Constants.verdana8
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let fiveStoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.fiveStoryPhoto)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let fiveStoryLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.fiveStoryTitle
        label.font = Constants.verdana8
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let storyScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isScrollEnabled = true
        scrollView.showsHorizontalScrollIndicator = false

        return scrollView
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func configureStoryScrollView() {
        contentView.addSubview(storyScrollView)
        storyScrollView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        storyScrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        storyScrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        storyScrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

        insideView.translatesAutoresizingMaskIntoConstraints = false
        storyScrollView.addSubview(insideView)

        insideView.leadingAnchor.constraint(equalTo: storyScrollView.leadingAnchor).isActive = true
        insideView.trailingAnchor.constraint(equalTo: storyScrollView.trailingAnchor).isActive = true
        insideView.topAnchor.constraint(equalTo: storyScrollView.topAnchor).isActive = true
        insideView.bottomAnchor.constraint(equalTo: storyScrollView.bottomAnchor).isActive = true
        insideView.heightAnchor.constraint(equalTo: storyScrollView.heightAnchor).isActive = true
        insideView.widthAnchor.constraint(equalTo: storyScrollView.widthAnchor, multiplier: 1.2).isActive = true
    }

    private func configureFirstStory() {
        insideView.addSubview(firstStoryPhotoImageView)
        firstStoryPhotoImageView.topAnchor.constraint(equalTo: storyScrollView.topAnchor, constant: 7).isActive = true
        firstStoryPhotoImageView.leftAnchor.constraint(
            equalTo: insideView.leftAnchor,
            constant: 18
        ).isActive = true
        firstStoryPhotoImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        firstStoryPhotoImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true

        insideView.addSubview(firstStoryLabel)
        firstStoryLabel.topAnchor.constraint(
            equalTo: firstStoryPhotoImageView.bottomAnchor,
            constant: 5
        ).isActive = true
        firstStoryLabel.leftAnchor.constraint(equalTo: insideView.leftAnchor, constant: 8).isActive = true
        firstStoryLabel.widthAnchor.constraint(equalToConstant: 74).isActive = true
        firstStoryLabel.bottomAnchor.constraint(
            equalTo: storyScrollView.bottomAnchor,
            constant: -5
        ).isActive = true
    }

    private func configureSecondStory() {
        insideView.addSubview(secondStoryLabel)
        secondStoryLabel.topAnchor.constraint(
            equalTo: firstStoryPhotoImageView.bottomAnchor,
            constant: 5
        ).isActive = true
        secondStoryLabel.leftAnchor.constraint(
            equalTo: firstStoryLabel.rightAnchor,
            constant: 8
        ).isActive = true
        secondStoryLabel.widthAnchor.constraint(equalToConstant: 74).isActive = true
        secondStoryLabel.bottomAnchor.constraint(
            equalTo: storyScrollView.bottomAnchor,
            constant: -5
        ).isActive = true

        insideView.addSubview(secondStoryPhotoImageView)
        secondStoryPhotoImageView.topAnchor.constraint(
            equalTo: storyScrollView.topAnchor,
            constant: 7
        ).isActive = true
        secondStoryPhotoImageView.leftAnchor.constraint(
            equalTo: firstStoryPhotoImageView.rightAnchor,
            constant: 22
        ).isActive = true
        secondStoryPhotoImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        secondStoryPhotoImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }

    private func configureThridStory() {
        insideView.addSubview(thridStoryLabel)
        thridStoryLabel.topAnchor.constraint(
            equalTo: secondStoryPhotoImageView.bottomAnchor,
            constant: 5
        ).isActive = true
        thridStoryLabel.leftAnchor.constraint(
            equalTo: secondStoryLabel.rightAnchor,
            constant: 8
        ).isActive = true
        thridStoryLabel.widthAnchor.constraint(equalToConstant: 74).isActive = true
        thridStoryLabel.bottomAnchor.constraint(
            equalTo: storyScrollView.bottomAnchor,
            constant: -5
        ).isActive = true

        insideView.addSubview(thridStoryImageView)
        thridStoryImageView.topAnchor.constraint(
            equalTo: storyScrollView.topAnchor,
            constant: 7
        ).isActive = true
        thridStoryImageView.leftAnchor.constraint(
            equalTo: secondStoryPhotoImageView.rightAnchor,
            constant: 22
        ).isActive = true
        thridStoryImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        thridStoryImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }

    private func configureFourthStory() {
        insideView.addSubview(fourStoryLabel)
        fourStoryLabel.topAnchor.constraint(
            equalTo: thridStoryImageView.bottomAnchor,
            constant: 5
        ).isActive = true
        fourStoryLabel.leftAnchor.constraint(
            equalTo: thridStoryLabel.rightAnchor,
            constant: 8
        ).isActive = true
        fourStoryLabel.widthAnchor.constraint(equalToConstant: 74).isActive = true
        fourStoryLabel.bottomAnchor.constraint(
            equalTo: storyScrollView.bottomAnchor,
            constant: -5
        ).isActive = true

        insideView.addSubview(fourStoryImageView)
        fourStoryImageView.topAnchor.constraint(
            equalTo: storyScrollView.topAnchor,
            constant: 7
        ).isActive = true
        fourStoryImageView.leftAnchor.constraint(
            equalTo: thridStoryImageView.rightAnchor,
            constant: 22
        ).isActive = true
        fourStoryImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        fourStoryImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }

    private func configureFifthStory() {
        insideView.addSubview(fiveStoryLabel)
        fiveStoryLabel.topAnchor.constraint(
            equalTo: fourStoryImageView.bottomAnchor,
            constant: 5
        ).isActive = true
        fiveStoryLabel.leftAnchor.constraint(
            equalTo: fourStoryLabel.rightAnchor,
            constant: 8
        ).isActive = true
        fiveStoryLabel.widthAnchor.constraint(equalToConstant: 74).isActive = true
        fiveStoryLabel.bottomAnchor.constraint(
            equalTo: storyScrollView.bottomAnchor,
            constant: -5
        ).isActive = true

        insideView.addSubview(fiveStoryImageView)
        fiveStoryImageView.topAnchor.constraint(
            equalTo: storyScrollView.topAnchor,
            constant: 7
        ).isActive = true
        fiveStoryImageView.leftAnchor.constraint(
            equalTo: fourStoryImageView.rightAnchor,
            constant: 22
        ).isActive = true
        fiveStoryImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        fiveStoryImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }

    private func setupCell() {
        configureStoryScrollView()
        configureFirstStory()
        configureSecondStory()
        configureThridStory()
        configureFourthStory()
        configureFifthStory()
    }
}
