// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit
import WebKit

/// Экран профиля
final class ProfileViewController: UIViewController {
    // MARK: - Constants

    /// Типы ячеек
    enum TypeCells {
        /// Ячейка с информацией
        case information
        /// Ячейка с коллекцией фотографий
        case photoCollection
        /// Ячейка с историями
        case story
    }

    enum Constants {
        static let myPhoto = "myPhoto"
        static let turPhoto = "turPhoto"
        static let informationCell = "InformationCell"
        static let photoCollectionCell = "PhotoCollectionCell"
        static let profileStoryCell = "ProfileStoryCell"
        static let lockIcon = "lockIcon"
        static let rmLink = "ruslan_rmLink"
        static let plusImage = "plusImage"
        static let listImage = "listImage"
        static let linkSpaceX = "https://www.spacex.com"
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

    // MARK: - Private Properties

    private let typesCells: [TypeCells] = [.information, .story, .photoCollection]
    private let profileTableView: UITableView = .init()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Private Methods

    private func configureUI() {
        configureNavigationItem()
        view.backgroundColor = .white
        configureTableView()
    }

    private func configureTableView() {
        profileTableView.translatesAutoresizingMaskIntoConstraints = false
        setupTableView()

        profileTableView.dataSource = self
        profileTableView.register(PhotoCollectionCell.self, forCellReuseIdentifier: Constants.photoCollectionCell)
        profileTableView.register(InformationCell.self, forCellReuseIdentifier: Constants.informationCell)
        profileTableView.register(ProfileStoryCell.self, forCellReuseIdentifier: Constants.profileStoryCell)
        profileTableView.rowHeight = UITableView.automaticDimension
        profileTableView.backgroundColor = .white
        profileTableView.separatorStyle = .none
    }

    private func setupTableView() {
        view.addSubview(profileTableView)
        profileTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        profileTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        profileTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        profileTableView.widthAnchor.constraint(equalToConstant: 375).isActive = true
    }

    private func setLeftNavigationItem() {
        let customViewLeftItem = UIView()
        customViewLeftItem.translatesAutoresizingMaskIntoConstraints = false

        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: Constants.lockIcon)
        imageView.contentMode = .scaleAspectFit

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.rmLink
        label.font = Constants.verdanaBold18
        label.textColor = .black

        customViewLeftItem.addSubview(imageView)
        customViewLeftItem.addSubview(label)

        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: customViewLeftItem.leadingAnchor),
            imageView.centerYAnchor.constraint(equalTo: customViewLeftItem.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 18),
            imageView.heightAnchor.constraint(equalToConstant: 18),

            label.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8),
            label.trailingAnchor.constraint(equalTo: customViewLeftItem.trailingAnchor),
            label.centerYAnchor.constraint(equalTo: customViewLeftItem.centerYAnchor)
        ])

        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: customViewLeftItem)
    }

    private func setRightNavigationItem() {
        let customViewRightItem = UIView()
        customViewRightItem.translatesAutoresizingMaskIntoConstraints = false

        let firstImageView = UIImageView()
        firstImageView.translatesAutoresizingMaskIntoConstraints = false
        firstImageView.image = UIImage(named: Constants.plusImage)
        firstImageView.contentMode = .scaleAspectFit

        let secondImageView = UIImageView()
        secondImageView.translatesAutoresizingMaskIntoConstraints = false
        secondImageView.image = UIImage(named: Constants.listImage)
        secondImageView.contentMode = .scaleAspectFit

        customViewRightItem.addSubview(firstImageView)
        customViewRightItem.addSubview(secondImageView)

        NSLayoutConstraint.activate([
            firstImageView.leadingAnchor.constraint(equalTo: customViewRightItem.leadingAnchor),
            firstImageView.centerYAnchor.constraint(equalTo: customViewRightItem.centerYAnchor),
            firstImageView.widthAnchor.constraint(equalToConstant: 18),
            firstImageView.heightAnchor.constraint(equalToConstant: 18),

            secondImageView.leadingAnchor.constraint(equalTo: firstImageView.trailingAnchor, constant: 8),
            secondImageView.centerYAnchor.constraint(equalTo: customViewRightItem.centerYAnchor),
            secondImageView.widthAnchor.constraint(equalToConstant: 18),
            secondImageView.heightAnchor.constraint(equalToConstant: 18)
        ])
        customViewRightItem.widthAnchor.constraint(greaterThanOrEqualToConstant: 60).isActive = true

        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: customViewRightItem)
    }

    private func configureNavigationItem() {
        setLeftNavigationItem()
        setRightNavigationItem()
    }
}

// MARK: - UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let typeCell = typesCells[indexPath.row]
        switch typeCell {
        case .information:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.informationCell,
                for: indexPath
            ) as? InformationCell
            else { fatalError() }

            cell.delegate = self
            return cell
        case .photoCollection:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.photoCollectionCell,
                for: indexPath
            ) as? PhotoCollectionCell
            else { fatalError() }
            return cell

        case .story:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.profileStoryCell,
                for: indexPath
            ) as? ProfileStoryCell
            else { fatalError() }
            return cell
        }
    }
}

// MARK: - TableViewCellDelegate

extension ProfileViewController: TableViewCellDelegate {
    func didTapButton(in cell: InformationCell) {
        guard let url = URL(string: Constants.linkSpaceX) else { return }
        let webView = WKWebView(frame: UIScreen.main.bounds)
        webView.load(URLRequest(url: url))

        let viewController = UIViewController()
        viewController.view = webView

        present(viewController, animated: true, completion: nil)
    }
}
