// RecomendationCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// RecomendationViewCell
class RecomendationCell: UITableViewCell {
    // MARK: - Types

    // MARK: - Constants

    enum Constants {
        static let myPhoto = "myPhoto"
        static let userPhoto = "userPhoto"
        static let recomendationText = "Рекомендуем вам"
        static let allRecomendationText = "Все"
        static let subscribeText = "Подписаться"
        static let userNickname = "lavanda123"
        static let commentText = "Комментировать..."
        static let commentImage = "comment"
        static let exportImage = "export"
        static let saveImage = "save"
        static let myNickname = "rus1asha"
        static let turNickname = "tur_v_dagestan"
        static let likesText = "Нравится: 201"
        static let descriptionText = "Насладитесь красотой природы. Забронировать тур в Дагестан можно уже сейчас!"
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

    // MARK: - IBOutlets

    // MARK: - Visual Components

    private let recomendationLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.recomendationText
        label.font = Constants.verdanaBold10
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let allRecomendationLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.allRecomendationText
        label.font = Constants.verdanaBold10
        label.textAlignment = .right
        label.textColor = .blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let firstView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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

    private let firstSubscribeButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.subscribeText, for: .normal)
        button.titleLabel?.font = Constants.verdanaBold10
        button.tintColor = .white
        button.backgroundColor = .blue
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let secondView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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

    private let secondSubscribeButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.subscribeText, for: .normal)
        button.titleLabel?.font = Constants.verdanaBold10
        button.tintColor = .white
        button.backgroundColor = .blue
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let thridView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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

    private let thridSubscribeButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.subscribeText, for: .normal)
        button.titleLabel?.font = Constants.verdanaBold10
        button.tintColor = .white
        button.backgroundColor = .blue
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let recomendationScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isScrollEnabled = true
        scrollView.showsHorizontalScrollIndicator = true
        return scrollView
    }()

    // MARK: - Public Properties

    // MARK: - Private Properties

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle

    // MARK: - Public Methods

    // MARK: - IBAction

    // MARK: - Private Methods

    private func setupCell() {
        contentView.backgroundColor = .appLightBlue
        contentView.addSubview(recomendationScrollView)
        recomendationScrollView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        recomendationScrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        recomendationScrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        recomendationScrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

        let insideView = UIView()
        insideView.translatesAutoresizingMaskIntoConstraints = false
        recomendationScrollView.addSubview(insideView)

        insideView.leadingAnchor.constraint(equalTo: recomendationScrollView.leadingAnchor).isActive = true
        insideView.trailingAnchor.constraint(equalTo: recomendationScrollView.trailingAnchor).isActive = true
        insideView.topAnchor.constraint(equalTo: recomendationScrollView.topAnchor).isActive = true
        insideView.bottomAnchor.constraint(equalTo: recomendationScrollView.bottomAnchor).isActive = true
        insideView.heightAnchor.constraint(equalTo: recomendationScrollView.heightAnchor).isActive = true
        insideView.widthAnchor.constraint(equalTo: recomendationScrollView.widthAnchor, multiplier: 1.3).isActive = true

        insideView.addSubview(recomendationLabel)
        recomendationLabel.topAnchor.constraint(equalTo: recomendationScrollView.topAnchor, constant: 9).isActive = true
        recomendationLabel.leftAnchor.constraint(
            equalTo: recomendationScrollView.leftAnchor,
            constant: 12
        ).isActive = true
        recomendationLabel.widthAnchor.constraint(equalToConstant: 107).isActive = true
        recomendationLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true

        insideView.addSubview(allRecomendationLabel)
        allRecomendationLabel.topAnchor.constraint(
            equalTo: recomendationScrollView.topAnchor,

            constant: 9
        ).isActive = true
        allRecomendationLabel.leftAnchor.constraint(
            equalTo: recomendationScrollView.leftAnchor,
            constant: 258
        ).isActive = true
        allRecomendationLabel.widthAnchor.constraint(equalToConstant: 107).isActive = true
        allRecomendationLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true

        insideView.addSubview(firstView)
        firstView.topAnchor.constraint(
            equalTo: recomendationLabel.bottomAnchor,
            constant: 21
        ).isActive = true
        firstView.leftAnchor.constraint(
            equalTo: recomendationScrollView.leftAnchor,
            constant: 17
        ).isActive = true
        firstView.widthAnchor.constraint(equalToConstant: 185).isActive = true
        firstView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        firstView.bottomAnchor.constraint(
            equalTo: recomendationScrollView.bottomAnchor,
            constant: -25
        ).isActive = true
        firstView.backgroundColor = .white

        firstView.addSubview(firstUserPhotoImageView)
        firstUserPhotoImageView.topAnchor.constraint(
            equalTo: firstView.topAnchor,

            constant: 15
        ).isActive = true
        firstUserPhotoImageView.leftAnchor.constraint(
            equalTo: firstView.leftAnchor,
            constant: 35
        ).isActive = true
        firstUserPhotoImageView.widthAnchor.constraint(equalToConstant: 115).isActive = true
        firstUserPhotoImageView.heightAnchor.constraint(equalToConstant: 115).isActive = true

        firstView.addSubview(firstUserNickNameLabel)
        firstUserNickNameLabel.topAnchor.constraint(
            equalTo: firstUserPhotoImageView.bottomAnchor,

            constant: 5
        ).isActive = true
        firstUserNickNameLabel.leftAnchor.constraint(
            equalTo: firstView.leftAnchor,

            constant: 42
        ).isActive = true
        firstUserNickNameLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        firstUserNickNameLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true

        firstView.addSubview(firstSubscribeButton)
        firstSubscribeButton.topAnchor.constraint(
            equalTo: firstUserNickNameLabel.bottomAnchor,

            constant: 9
        ).isActive = true
        firstSubscribeButton.leftAnchor.constraint(
            equalTo: firstView.leftAnchor,

            constant: 10
        ).isActive = true
        firstSubscribeButton.widthAnchor.constraint(equalToConstant: 165).isActive = true
        firstSubscribeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true

        insideView.addSubview(secondView)
        secondView.topAnchor.constraint(
            equalTo: recomendationLabel.bottomAnchor,
            constant: 21
        ).isActive = true
        secondView.leftAnchor.constraint(
            equalTo: firstView.rightAnchor,
            constant: 20
        ).isActive = true
        secondView.widthAnchor.constraint(equalToConstant: 185).isActive = true
        secondView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        secondView.bottomAnchor.constraint(
            equalTo: recomendationScrollView.bottomAnchor,
            constant: -25
        ).isActive = true
        secondView.backgroundColor = .white

        secondView.addSubview(secondUserPhotoImageView)
        secondUserPhotoImageView.topAnchor.constraint(
            equalTo: secondView.topAnchor,

            constant: 15
        ).isActive = true
        secondUserPhotoImageView.leftAnchor.constraint(
            equalTo: secondView.leftAnchor,
            constant: 35
        ).isActive = true
        secondUserPhotoImageView.widthAnchor.constraint(equalToConstant: 115).isActive = true
        secondUserPhotoImageView.heightAnchor.constraint(equalToConstant: 115).isActive = true

        secondView.addSubview(secondUserNickNameLabel)
        secondUserNickNameLabel.topAnchor.constraint(
            equalTo: secondUserPhotoImageView.bottomAnchor,

            constant: 5
        ).isActive = true
        secondUserNickNameLabel.leftAnchor.constraint(
            equalTo: secondView.leftAnchor,

            constant: 42
        ).isActive = true
        secondUserNickNameLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        secondUserNickNameLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true

        secondView.addSubview(secondSubscribeButton)
        secondSubscribeButton.topAnchor.constraint(
            equalTo: secondUserNickNameLabel.bottomAnchor,

            constant: 9
        ).isActive = true
        secondSubscribeButton.leftAnchor.constraint(
            equalTo: secondView.leftAnchor,

            constant: 10
        ).isActive = true
        secondSubscribeButton.widthAnchor.constraint(equalToConstant: 165).isActive = true
        secondSubscribeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}
