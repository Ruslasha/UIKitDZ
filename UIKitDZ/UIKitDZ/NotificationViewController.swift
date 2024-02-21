// NotificationViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ds
class NotificationViewController: UIViewController {
    // MARK: - Types

    // MARK: - Constants

    enum Constants {
        static let myPhoto = "myPhoto"
        static let turPhoto = "turPhoto"
        static let notificationText = "Уведомления"
        static let requestText = "Запросы на подписку"
        static let firstAvatarImage = UIImage(named: "userPhoto")
        static let firstPictureImage = UIImage(named: "naturePicture")
        static let firstText = "lavanda123 понравился ваш комментарий: \"Очень красиво!\" 12ч"
        static let verdanaBold18 = UIFont(name: "Verdana-Bold", size: 18)
        static let verdanaBold16 = UIFont(name: "Verdana-Bold", size: 16)
        static let verdanaBold26 = UIFont(name: "Verdana-Bold", size: 26)
        static let verdanaBold22 = UIFont(name: "Verdana-Bold", size: 22)
        static let verdanaBold12 = UIFont(name: "Verdana-Bold", size: 12)
        static let verdanaBold10 = UIFont(name: "Verdana-Bold", size: 10)
        static let verdanaBold14 = UIFont(name: "Verdana-Bold", size: 14)
        static let verdana16 = UIFont(name: "Verdana", size: 16)
        static let verdana14 = UIFont(name: "Verdana", size: 14)
        static let verdana12 = UIFont(name: "Verdana", size: 12)
        static let verdana10 = UIFont(name: "Verdana", size: 10)
    }

    let tableView: UITableView = .init()

    private let notificationLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.notificationText
        label.font = Constants.verdanaBold22
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let requestLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.requestText
        label.font = Constants.verdana14
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - IBOutlets

    // MARK: - Visual Components

    // MARK: - Public Properties

    // MARK: - Private Properties

    private var notifications: [NotificationLink] = []

    // MARK: - Initializers

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        setupTableView()
        let firstAvatarImage = Constants.firstAvatarImage
        let firstPictureImage = Constants.firstPictureImage

        if let firstAvatar = firstAvatarImage, let firstPicture = firstPictureImage {
            let firstNotification = NotificationLink(
                text: Constants.firstText, avatar: firstAvatar, picture: firstPicture
            )
            notifications.append(firstNotification)
            notifications.append(firstNotification)
            notifications.append(firstNotification)
            notifications.append(firstNotification)
            notifications.append(firstNotification)
            notifications.append(firstNotification)
            notifications.append(firstNotification)
            notifications.append(firstNotification)
            notifications.append(firstNotification)
        }
//
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(NotificationPictureCell.self, forCellReuseIdentifier: "NotificationPictureCell")
        tableView.register(NotificationButtonCell.self, forCellReuseIdentifier: "NotificationButtonCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
    }

    // MARK: - Public Methods

    // MARK: - IBAction

    // MARK: - Private Methods
}

extension NotificationViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return min(2, notifications.count)
        } else if section == 1 {
            return max(0, notifications.count - 2)
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionOffset = min(2, notifications.count)

        if indexPath.row == 3 {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "NotificationButtonCell", for: indexPath
            ) as? NotificationButtonCell
            else { fatalError() }

            cell.configure(notification: notifications[indexPath.row])
            return cell

        } else if indexPath.row == 5 {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "NotificationButtonCell", for: indexPath
            ) as? NotificationButtonCell
            else { fatalError() }

            cell.configure(notification: notifications[indexPath.row])

            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "NotificationPictureCell", for: indexPath
            ) as? NotificationPictureCell
            else { fatalError() }

            cell.configure(notification: notifications[indexPath.row])
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
}

extension NotificationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        headerView.backgroundColor = .white

        let label = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        if section == 0 {
            label.text = "Сегодня"
        } else if section == 1 {
            label.text = "На этой неделе"
        }
        label.font = Constants.verdanaBold14
        label.textColor = .black
        headerView.addSubview(label)

        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
}

extension NotificationViewController {
    func setupTableView() {
        view.backgroundColor = .white
        view.addSubview(notificationLabel)
        notificationLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 57).isActive = true
        notificationLabel.heightAnchor.constraint(equalToConstant: 27).isActive = true
        notificationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
        notificationLabel.widthAnchor.constraint(equalToConstant: 194).isActive = true

        view.addSubview(requestLabel)
        requestLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 110).isActive = true
        requestLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
        requestLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
        requestLabel.widthAnchor.constraint(equalToConstant: 251).isActive = true

        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: requestLabel.bottomAnchor, constant: 21).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
        tableView.widthAnchor.constraint(equalToConstant: 351).isActive = true
    }
}
