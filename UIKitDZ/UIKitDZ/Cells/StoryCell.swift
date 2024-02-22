// StoryCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка таблицы с историями
final class StoryCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let myPhoto = "myPhoto"
        static let userPhoto = "userPhoto"
        static let yourStoryText = "Ваша история"
        static let userNickname = "lavanda123"
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
    private let myPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.myPhoto)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let youStoryLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.yourStoryText
        label.font = Constants.verdana8
        label.textAlignment = .center
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let firstUserPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.userPhoto)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let firstUserNickNameLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.userNickname
        label.font = Constants.verdana8
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let secondUserPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.userPhoto)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let secondUserNickNameLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.userNickname
        label.font = Constants.verdana8
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let thridUserPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.userPhoto)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let thridUserNickNameLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.userNickname
        label.font = Constants.verdana8
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let fourUserPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.userPhoto)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let fourUserNickNameLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.userNickname
        label.font = Constants.verdana8
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let fiveUserPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.userPhoto)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let fiveUserNickNameLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.userNickname
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
        insideView.widthAnchor.constraint(equalTo: storyScrollView.widthAnchor, multiplier: 1.3).isActive = true
    }

    private func configureYourStory() {
        insideView.addSubview(myPhotoImageView)
        myPhotoImageView.topAnchor.constraint(equalTo: storyScrollView.topAnchor, constant: 7).isActive = true
        myPhotoImageView.leftAnchor.constraint(equalTo: storyScrollView.leftAnchor, constant: 12).isActive = true
        myPhotoImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        myPhotoImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true

        insideView.addSubview(youStoryLabel)
        youStoryLabel.topAnchor.constraint(equalTo: myPhotoImageView.bottomAnchor, constant: 5).isActive = true
        youStoryLabel.leftAnchor.constraint(equalTo: storyScrollView.leftAnchor, constant: 5).isActive = true
        youStoryLabel.widthAnchor.constraint(equalToConstant: 74).isActive = true
        youStoryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
    }

    private func configureFirstStory() {
        insideView.addSubview(firstUserPhotoImageView)
        firstUserPhotoImageView.topAnchor.constraint(equalTo: storyScrollView.topAnchor, constant: 7).isActive = true
        firstUserPhotoImageView.leftAnchor.constraint(
            equalTo: myPhotoImageView.rightAnchor,
            constant: 22
        ).isActive = true
        firstUserPhotoImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        firstUserPhotoImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true

        insideView.addSubview(firstUserNickNameLabel)
        firstUserNickNameLabel.topAnchor.constraint(
            equalTo: firstUserPhotoImageView.bottomAnchor,
            constant: 5
        ).isActive = true
        firstUserNickNameLabel.leftAnchor.constraint(equalTo: youStoryLabel.rightAnchor, constant: 8).isActive = true
        firstUserNickNameLabel.widthAnchor.constraint(equalToConstant: 74).isActive = true
        firstUserNickNameLabel.bottomAnchor.constraint(
            equalTo: storyScrollView.bottomAnchor,
            constant: -5
        ).isActive = true
    }

    private func configureSecondStory() {
        insideView.addSubview(secondUserNickNameLabel)
        secondUserNickNameLabel.topAnchor.constraint(
            equalTo: firstUserPhotoImageView.bottomAnchor,
            constant: 5
        ).isActive = true
        secondUserNickNameLabel.leftAnchor.constraint(
            equalTo: firstUserNickNameLabel.rightAnchor,
            constant: 8
        ).isActive = true
        secondUserNickNameLabel.widthAnchor.constraint(equalToConstant: 74).isActive = true
        secondUserNickNameLabel.bottomAnchor.constraint(
            equalTo: storyScrollView.bottomAnchor,
            constant: -5
        ).isActive = true

        insideView.addSubview(secondUserPhotoImageView)
        secondUserPhotoImageView.topAnchor.constraint(
            equalTo: storyScrollView.topAnchor,
            constant: 7
        ).isActive = true
        secondUserPhotoImageView.leftAnchor.constraint(
            equalTo: firstUserPhotoImageView.rightAnchor,
            constant: 22
        ).isActive = true
        secondUserPhotoImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        secondUserPhotoImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }

    private func configureThridStory() {
        insideView.addSubview(thridUserNickNameLabel)
        thridUserNickNameLabel.topAnchor.constraint(
            equalTo: secondUserPhotoImageView.bottomAnchor,
            constant: 5
        ).isActive = true
        thridUserNickNameLabel.leftAnchor.constraint(
            equalTo: secondUserNickNameLabel.rightAnchor,
            constant: 8
        ).isActive = true
        thridUserNickNameLabel.widthAnchor.constraint(equalToConstant: 74).isActive = true
        thridUserNickNameLabel.bottomAnchor.constraint(
            equalTo: storyScrollView.bottomAnchor,
            constant: -5
        ).isActive = true

        insideView.addSubview(thridUserPhotoImageView)
        thridUserPhotoImageView.topAnchor.constraint(
            equalTo: storyScrollView.topAnchor,
            constant: 7
        ).isActive = true
        thridUserPhotoImageView.leftAnchor.constraint(
            equalTo: secondUserPhotoImageView.rightAnchor,
            constant: 22
        ).isActive = true
        thridUserPhotoImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        thridUserPhotoImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }

    private func configureFourthStory() {
        insideView.addSubview(fourUserNickNameLabel)
        fourUserNickNameLabel.topAnchor.constraint(
            equalTo: thridUserPhotoImageView.bottomAnchor,
            constant: 5
        ).isActive = true
        fourUserNickNameLabel.leftAnchor.constraint(
            equalTo: thridUserNickNameLabel.rightAnchor,
            constant: 8
        ).isActive = true
        fourUserNickNameLabel.widthAnchor.constraint(equalToConstant: 74).isActive = true
        fourUserNickNameLabel.bottomAnchor.constraint(
            equalTo: storyScrollView.bottomAnchor,
            constant: -5
        ).isActive = true

        insideView.addSubview(fourUserPhotoImageView)
        fourUserPhotoImageView.topAnchor.constraint(
            equalTo: storyScrollView.topAnchor,
            constant: 7
        ).isActive = true
        fourUserPhotoImageView.leftAnchor.constraint(
            equalTo: thridUserPhotoImageView.rightAnchor,
            constant: 22
        ).isActive = true
        fourUserPhotoImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        fourUserPhotoImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }

    private func configureFifthStory() {
        insideView.addSubview(fiveUserNickNameLabel)
        fiveUserNickNameLabel.topAnchor.constraint(
            equalTo: fourUserPhotoImageView.bottomAnchor,
            constant: 5
        ).isActive = true
        fiveUserNickNameLabel.leftAnchor.constraint(
            equalTo: fourUserNickNameLabel.rightAnchor,
            constant: 8
        ).isActive = true
        fiveUserNickNameLabel.widthAnchor.constraint(equalToConstant: 74).isActive = true
        fiveUserNickNameLabel.bottomAnchor.constraint(
            equalTo: storyScrollView.bottomAnchor,
            constant: -5
        ).isActive = true

        insideView.addSubview(fiveUserPhotoImageView)
        fiveUserPhotoImageView.topAnchor.constraint(
            equalTo: storyScrollView.topAnchor,
            constant: 7
        ).isActive = true
        fiveUserPhotoImageView.leftAnchor.constraint(
            equalTo: fourUserPhotoImageView.rightAnchor,
            constant: 22
        ).isActive = true
        fiveUserPhotoImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        fiveUserPhotoImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }

    private func setupCell() {
        configureStoryScrollView()
        configureYourStory()
        configureFirstStory()
        configureSecondStory()
        configureThridStory()
        configureFourthStory()
        configureFifthStory()
    }
}
