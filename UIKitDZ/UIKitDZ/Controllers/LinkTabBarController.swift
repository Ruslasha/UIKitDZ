// LinkTabBarController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Главный таббар
final class LinkTabBarController: UITabBarController {
    // MARK: - Constants

    enum Constants {
        static let lentaTitle = "Лента"
        static let houseImage = "house"
        static let notificationText = "Уведомления"
        static let notificationImage = "notification"
        static let profileTitle = "Профиль"
        static let personImage = "person"
    }

    // MARK: - Private Properties

    private let mainPageViewController = MainPageViewController()
    private let mainPageTabBarItem = UITabBarItem(
        title: Constants.lentaTitle,
        image: UIImage(named: Constants.houseImage),
        tag: 0
    )

    private let notificationViewController = NotificationViewController()
    private let notificationTabBarItem = UITabBarItem(
        title: Constants.notificationText,
        image: UIImage(named: Constants.notificationImage),
        tag: 1
    )
    private let profileViewController = ProfileViewController()
    private let profileTabBarItem = UITabBarItem(
        title: Constants.profileTitle,
        image: UIImage(named: Constants.personImage),
        tag: 2
    )

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }

    // MARK: - Private Methods

    private func configureTabBarColor() {
        tabBar.tintColor = UIColor(
            red: 0.0 / 255.0,
            green: 122.0 / 255.0,
            blue: 255.0 / 255.0,
            alpha: 1
        )
        tabBar.barTintColor = .white
    }

    private func setupTabBar() {
        let mainPageNavigationController = UINavigationController(rootViewController: mainPageViewController)
        mainPageNavigationController.tabBarItem = mainPageTabBarItem
        let notificationNavigationController = NotificationViewController()
        notificationNavigationController.tabBarItem = notificationTabBarItem
        let profileNavigationController = UINavigationController(rootViewController: profileViewController)
        profileNavigationController.tabBarItem = profileTabBarItem
        viewControllers = [
            mainPageNavigationController,
            notificationNavigationController,
            profileNavigationController
        ]
        configureTabBarColor()
    }
}
