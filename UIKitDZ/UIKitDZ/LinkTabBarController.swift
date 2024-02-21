// LinkTabBarController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// LinkTabBarController
class LinkTabBarController: UITabBarController {
    private let mainPageViewController = MainPageViewController()
    private let mainPageTabBarItem = UITabBarItem(
        title: "Лента",
        image: UIImage(named: "house"),
        tag: 0
    )

    private let notificationViewController = NotificationViewController()
    private let notificationTabBarItem = UITabBarItem(
        title: "Уведомления",
        image: UIImage(named: "notification"),
        selectedImage: UIImage(named: "fillBag")
    )
    private let profileViewController = ProfileViewController()
    private let profileTabBarItem = UITabBarItem(
        title: "Профиль",
        image: UIImage(named: "person"),
        tag: 2
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }

    func setupTabBar() {
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

        tabBar.tintColor = UIColor(
            red: 0.0 / 255.0,
            green: 122.0 / 255.0,
            blue: 255.0 / 255.0,
            alpha: 1
        )
        tabBar.barTintColor = .white
    }
}
