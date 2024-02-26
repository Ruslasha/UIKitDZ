// MainPageViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Стартовый экран приложения, лента
final class MainPageViewController: UIViewController {
    // MARK: - Constants

    /// Типы ячеек
    enum TypeCells {
        /// Ячейка с историей
        case story
        /// Ячейка с рекомендациями
        case recomendation
        /// Ячейка с постом
        case post
    }

    enum Constants {
        static let myPhoto = "myPhoto"
        static let turPhoto = "turPhoto"
        static let naturePicture = "naturePicture"
        static let secondPicture = "secondPicture"
        static let thridPicture = "thridPicture"
        static let heartImage = "heart"
        static let tenMinutesText = "10 минут назад"
        static let commentImage = "comment"
        static let exportImage = "export"
        static let saveImage = "save"
        static let myNickname = "rus1asha"
        static let turNickname = "tur_v_dagestan"
        static let likesText = "Нравится: 201"
        static let linkLogoImage = "RMLink"
        static let messageImage = "message"
        static let postCell = "PostCell"
        static let storyCell = "StoryCell"
        static let recomendationCell = "RecomendationCell"
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
    }

    // MARK: - Private Properties

    private let typesCells: [TypeCells] = [.story, .post, .recomendation, .post, .post, .post, .post]
    private var postsList: [Post] = []
    private let postsTableView: UITableView = .init()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Private Methods

    private func configureUI() {
        configureNavigationItem()
        configureTableView()
    }

    private func configureNavigationItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: Constants.linkLogoImage),
            style: .plain,
            target: self,
            action: nil
        )
        navigationItem.leftBarButtonItem?.tintColor = .black

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(named: Constants.messageImage),
            style: .plain,
            target: self,
            action: nil
        )
        navigationItem.rightBarButtonItem?.tintColor = .black
    }

    private func addPosts() {
        let turPhotoImage = UIImage(named: Constants.turPhoto)
        let turPictureImage = UIImage(named: Constants.naturePicture)
        let secondPictureImage = UIImage(named: Constants.secondPicture)
        let thridPictureImage = UIImage(named: Constants.thridPicture)

        guard let turPhoto = turPhotoImage, let turPicture = turPictureImage,
              let secondPicture = secondPictureImage, let thridPicture = thridPictureImage else { return }

        let firstPostImages = [turPicture, secondPicture, thridPicture]
        let firstPost = Post(
            nickname: Constants.turNickname,
            photo: turPhoto,
            pictures: firstPostImages,
            timeText: Constants.tenMinutesText
        )
        postsList.append(firstPost)
        postsList.append(firstPost)

        let secondPostImages = [secondPicture]
        let secondPost = Post(
            nickname: Constants.turNickname,
            photo: turPhoto,
            pictures: secondPostImages,
            timeText: Constants.tenMinutesText
        )
        postsList.append(secondPost)
        postsList.append(firstPost)
        postsList.append(secondPost)
        postsList.append(firstPost)
        postsList.append(firstPost)
    }

    private func configureTableView() {
        postsTableView.translatesAutoresizingMaskIntoConstraints = false
        setupTableView()
        addPosts()

        postsTableView.dataSource = self
        postsTableView.register(PostCell.self, forCellReuseIdentifier: Constants.postCell)
        postsTableView.register(StoryCell.self, forCellReuseIdentifier: Constants.storyCell)
        postsTableView.register(RecomendationCell.self, forCellReuseIdentifier: Constants.recomendationCell)
        postsTableView.rowHeight = UITableView.automaticDimension
        postsTableView.backgroundColor = .white
        postsTableView.separatorStyle = .none
    }
}

// MARK: - UITableViewDataSource

extension MainPageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        postsList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let typeCell = typesCells[indexPath.row]
        switch typeCell {
        case .post:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.postCell,
                for: indexPath
            ) as? PostCell
            else { fatalError() }

            cell.configure(post: postsList[indexPath.row])
            return cell
        case .recomendation:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.recomendationCell,
                for: indexPath
            ) as? RecomendationCell
            else { fatalError() }
            return cell
        case .story:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.storyCell,
                for: indexPath
            ) as? StoryCell
            else { fatalError() }
            return cell
        }
    }
}

extension MainPageViewController {
    func setupTableView() {
        view.addSubview(postsTableView)
        postsTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        postsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        postsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        postsTableView.widthAnchor.constraint(equalToConstant: 375).isActive = true
    }
}
