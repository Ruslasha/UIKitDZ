// NotificationPictureCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// nf
class NotificationPictureCell: UITableViewCell {
    // MARK: - Types

    // MARK: - Constants

    enum Constants {
        static let myPhoto = "myPhoto"
        static let userPhoto = "userPhoto"
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

    private let notificationLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.verdana12
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let pictureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
        contentView.addSubview(avatarImageView)
        avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        avatarImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true

        contentView.addSubview(notificationLabel)
        notificationLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        notificationLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 7).isActive = true
        notificationLabel.widthAnchor.constraint(equalToConstant: 240).isActive = true
        notificationLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true

        contentView.addSubview(pictureImageView)
        pictureImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        pictureImageView.leftAnchor.constraint(equalTo: notificationLabel.rightAnchor, constant: 24).isActive = true
        pictureImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        pictureImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

    func configure(notification: NotificationLink) {
        notificationLabel.text = notification.text
        avatarImageView.image = notification.avatar
        pictureImageView.image = notification.picture
    }
}
