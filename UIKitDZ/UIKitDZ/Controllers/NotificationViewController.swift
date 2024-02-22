// NotificationViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран уведомлений
final class NotificationViewController: UIViewController {
    // MARK: - Constants

    /// Типы ячеек
    enum TypeCells {
        /// Ячейка с кнопкой подписки
        case subscribe
        /// Ячейка с лайком
        case like
    }

    /// Секции
    enum TypeSections {
        /// Секция сегодня
        case today
        /// Секция на этой неделе
        case week
    }

    enum Constants {
        static let notificationPictureCell = "NotificationPictureCell"
        static let notificationButtonCell = "NotificationButtonCell"
        static let todaySection = "Сегодня"
        static let numberOfSections = 2
        static let cellHeight = 50.0
        static let heightForHeaderInSection = 40.0
        static let thisWeekSection = "На этой неделе"
        static let myPhoto = "myPhoto"
        static let turPhoto = "turPhoto"
        static let notificationText = "Уведомления"
        static let requestText = "Запросы на подписку"
        static let firstAvatarImage = UIImage(named: "userPhoto")
        static let firstPictureImage = UIImage(named: "naturePicture")
        static let firstText = "lavanda123 понравился ваш комментарий: \"Очень красиво!\" 12ч"
        static let subscribeText = "lavanda123 появился(-ась) в RMLink. Вы можете быть знакомы"
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

    // MARK: - Visual Components

    private let notificationTableView: UITableView = .init()
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

    // MARK: - Private Properties

    private let typesCells: [TypeCells] = [.like, .like, .like, .subscribe, .like, .subscribe]
    private let typesSections: [TypeSections] = [.today, .week]
    private var notificationsList: [NotificationLink] = []

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Private Methods

    private func configureUI() {
        notificationTableView.translatesAutoresizingMaskIntoConstraints = false
        setupTableView()
        let firstAvatarImage = Constants.firstAvatarImage
        let firstPictureImage = Constants.firstPictureImage

        if let firstAvatar = firstAvatarImage, let firstPicture = firstPictureImage {
            let firstNotification = NotificationLink(
                text: Constants.firstText, avatar: firstAvatar, picture: firstPicture
            )
            let subscribeNotification = NotificationLink(
                text: Constants.subscribeText, avatar: firstAvatar, picture: firstPicture
            )
            notificationsList.append(firstNotification)
            notificationsList.append(firstNotification)
            notificationsList.append(firstNotification)
            notificationsList.append(subscribeNotification)
            notificationsList.append(firstNotification)
            notificationsList.append(subscribeNotification)
            notificationsList.append(firstNotification)
            notificationsList.append(firstNotification)
        }

        notificationTableView.dataSource = self
        notificationTableView.delegate = self
        notificationTableView.register(
            NotificationPictureCell.self,

            forCellReuseIdentifier: Constants.notificationPictureCell
        )
        notificationTableView.register(
            NotificationButtonCell.self,

            forCellReuseIdentifier: Constants.notificationButtonCell
        )
        notificationTableView.rowHeight = UITableView.automaticDimension
        notificationTableView.backgroundColor = .white
        notificationTableView.separatorStyle = .none
    }
}

extension NotificationViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        Constants.numberOfSections
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let typeSections = typesSections[section]
        switch typeSections {
        case .today:
            return min(2, notificationsList.count)
        case .week:
            return max(0, notificationsList.count - 2)
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let typeCell = typesCells[indexPath.row]
        switch typeCell {
        case .like:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.notificationPictureCell, for: indexPath
            ) as? NotificationPictureCell
            else { fatalError() }

            cell.configure(notification: notificationsList[indexPath.row])
            return cell
        case .subscribe:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.notificationButtonCell, for: indexPath
            ) as? NotificationButtonCell
            else { fatalError() }

            cell.configure(notification: notificationsList[indexPath.row])
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constants.cellHeight
    }
}

extension NotificationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        headerView.backgroundColor = .white

        let label = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        let typeSections = typesSections[section]
        switch typeSections {
        case .today:
            label.text = Constants.todaySection
        case .week:
            label.text = Constants.thisWeekSection
        }
        label.font = Constants.verdanaBold14
        label.textColor = .black
        headerView.addSubview(label)

        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        Constants.heightForHeaderInSection
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

        view.addSubview(notificationTableView)
        notificationTableView.topAnchor.constraint(equalTo: requestLabel.bottomAnchor, constant: 21).isActive = true
        notificationTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        notificationTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
        notificationTableView.widthAnchor.constraint(equalToConstant: 351).isActive = true
    }
}
