// InformationCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit
import WebKit

protocol TableViewCellDelegate: AnyObject {
    func didTapButton(in cell: InformationCell)
}

/// Ячейка с информацией профиля
class InformationCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let myPhoto = "myPhoto"
        static let fio = "Ruslan Abramov"
        static let plusButtonImage = "plusPeopleIcon"
        static let jobTitle = "Programmist"
        static let changeButtonText = "Изменить"
        static let shareProfileText = "Поделиться профилем"
        static let publicationNumber = "67"
        static let subscribersNumber = "458"
        static let mySubscribeNumber = "120"
        static let publicationText = "публикации"
        static let subscribersText = "подписчики"
        static let mySubscribeText = "подписки"
        static let webLink = "\u{1F4CE}www.spacex.com"
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
    }

    // MARK: - Visual Components

    private let myPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.myPhoto)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let myFioLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.fio
        label.font = Constants.verdanaBold14
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let myJobLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.jobTitle
        label.font = Constants.verdana14
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let webLink: UILabel = {
        let label = UILabel()
        label.text = Constants.webLink
        label.font = Constants.verdana14
        label.textColor = .appBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = true
        return label
    }()

    private let webView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()

    private let changeButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.changeButtonText, for: .normal)
        button.titleLabel?.font = Constants.verdanaBold10
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .appLightGray
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let shareButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.shareProfileText, for: .normal)
        button.titleLabel?.font = Constants.verdanaBold10
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .appLightGray
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let plusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Constants.plusButtonImage), for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .appLightGray
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let subscribersNumberLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.subscribersNumber
        label.font = Constants.verdanaBold14
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let publicationNumberLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.publicationNumber
        label.font = Constants.verdanaBold14
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let mySubscribeNumberLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.mySubscribeNumber
        label.font = Constants.verdanaBold14
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let subscribersTextLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.subscribersText
        label.font = Constants.verdana10
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let publicationTextLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.publicationText
        label.font = Constants.verdana10
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let mySubscribeTextLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.mySubscribeText
        label.font = Constants.verdana10
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Public Properties

    weak var delegate: TableViewCellDelegate?

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

    @objc private func openWebsite() {
        delegate?.didTapButton(in: self)

//        guard let url = URL(string: "https://www.spacex.com") else { return }
//        let webView = WKWebView(frame: UIScreen.main.bounds)
//        webView.load(URLRequest(url: url))
//
//        let viewController = UIViewController()
//        viewController.view = webView
//
//        present(viewController, animated: true, completion: nil)
    }

    private func setupCell() {
        contentView.addSubview(myPhotoImageView)
        myPhotoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12).isActive = true
        myPhotoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        myPhotoImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        myPhotoImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true

        contentView.addSubview(myFioLabel)
        myFioLabel.topAnchor.constraint(equalTo: myPhotoImageView.bottomAnchor, constant: 9).isActive = true
        myFioLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        myFioLabel.widthAnchor.constraint(equalToConstant: 170).isActive = true
        myFioLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true

        contentView.addSubview(myJobLabel)
        myJobLabel.topAnchor.constraint(equalTo: myFioLabel.bottomAnchor, constant: 11).isActive = true
        myJobLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        myJobLabel.widthAnchor.constraint(equalToConstant: 298).isActive = true
        myJobLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true

        contentView.addSubview(webLink)
        webLink.topAnchor.constraint(equalTo: myJobLabel.bottomAnchor, constant: 6).isActive = true
        webLink.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 19).isActive = true
        webLink.widthAnchor.constraint(equalToConstant: 298).isActive = true
        webLink.heightAnchor.constraint(equalToConstant: 17).isActive = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(openWebsite))
        webLink.addGestureRecognizer(tapGesture)

        contentView.addSubview(changeButton)
        changeButton.topAnchor.constraint(equalTo: webLink.bottomAnchor, constant: 15).isActive = true
        changeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        changeButton.widthAnchor.constraint(equalToConstant: 155).isActive = true
        changeButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
        changeButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true

        contentView.addSubview(shareButton)
        shareButton.topAnchor.constraint(equalTo: webLink.bottomAnchor, constant: 15).isActive = true
        shareButton.leadingAnchor.constraint(equalTo: changeButton.trailingAnchor, constant: 5).isActive = true
        shareButton.widthAnchor.constraint(equalToConstant: 155).isActive = true
        shareButton.heightAnchor.constraint(equalToConstant: 27).isActive = true

        contentView.addSubview(plusButton)
        plusButton.topAnchor.constraint(equalTo: webLink.bottomAnchor, constant: 15).isActive = true
        plusButton.leadingAnchor.constraint(equalTo: shareButton.trailingAnchor, constant: 5).isActive = true
        plusButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        plusButton.heightAnchor.constraint(equalToConstant: 27).isActive = true

        contentView.addSubview(publicationNumberLabel)
        publicationNumberLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 22).isActive = true
        publicationNumberLabel.leadingAnchor.constraint(
            equalTo: myPhotoImageView.trailingAnchor,
            constant: 56
        ).isActive = true
        publicationNumberLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        publicationNumberLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true

        contentView.addSubview(publicationTextLabel)
        publicationTextLabel.topAnchor.constraint(
            equalTo: publicationNumberLabel.bottomAnchor,
            constant: 2
        ).isActive = true
        publicationTextLabel.leadingAnchor.constraint(
            equalTo: myPhotoImageView.trailingAnchor,
            constant: 46
        ).isActive = true
        publicationTextLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        publicationTextLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true

        contentView.addSubview(subscribersNumberLabel)
        subscribersNumberLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 22).isActive = true
        subscribersNumberLabel.leadingAnchor.constraint(
            equalTo: publicationNumberLabel.trailingAnchor,
            constant: 20
        ).isActive = true
        subscribersNumberLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        subscribersNumberLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true

        contentView.addSubview(subscribersTextLabel)
        subscribersTextLabel.topAnchor.constraint(
            equalTo: subscribersNumberLabel.bottomAnchor,
            constant: 2
        ).isActive = true
        subscribersTextLabel.leadingAnchor.constraint(
            equalTo: publicationTextLabel.trailingAnchor
        ).isActive = true
        subscribersTextLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        subscribersTextLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true

        contentView.addSubview(mySubscribeNumberLabel)
        mySubscribeNumberLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 22).isActive = true
        mySubscribeNumberLabel.leadingAnchor.constraint(
            equalTo: subscribersNumberLabel.trailingAnchor,
            constant: 20
        ).isActive = true
        mySubscribeNumberLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        mySubscribeNumberLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true

        contentView.addSubview(mySubscribeTextLabel)
        mySubscribeTextLabel.topAnchor.constraint(
            equalTo: mySubscribeNumberLabel.bottomAnchor,
            constant: 2
        ).isActive = true
        mySubscribeTextLabel.leadingAnchor.constraint(
            equalTo: subscribersTextLabel.trailingAnchor
        ).isActive = true
        mySubscribeTextLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        mySubscribeTextLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
    }
}
