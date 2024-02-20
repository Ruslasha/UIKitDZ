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
        static let naturePicture = "naturePicture"
        static let heartImage = "heart"
        static let tenMinutesText = "10 минут назад"
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
    }

    let tableView: UITableView = .init()

    // MARK: - IBOutlets

    // MARK: - Visual Components

    // MARK: - Public Properties

    // MARK: - Private Properties

    private var posts: [Post] = []

    // MARK: - Initializers

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.translatesAutoresizingMaskIntoConstraints = false

        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "RMLink"),

            style: .plain,
            target: self,
            action: nil
        )
        navigationItem.leftBarButtonItem?.tintColor = .black

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "message"),
            style: .plain,
            target: self,
            action: nil
        )
        navigationItem.rightBarButtonItem?.tintColor = .black

        setupTableView()
        let turPhotoImage = UIImage(named: Constants.turPhoto)
        let turPictureImage = UIImage(named: Constants.naturePicture)

        if let turPhoto = turPhotoImage, let turPicture = turPictureImage {
            let post1 = Post(
                nickname: Constants.turNickname,
                photo: turPhoto,
                picture: turPicture,
                timeText: Constants.tenMinutesText
            )
            posts.append(post1)
            posts.append(post1)
            posts.append(post1)
            posts.append(post1)
            posts.append(post1)
        }

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostCell.self, forCellReuseIdentifier: "PostCell")
        tableView.register(StoryCell.self, forCellReuseIdentifier: "StoryCell")
        tableView.register(RecomendationCell.self, forCellReuseIdentifier: "RecomendationCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
    }

    // MARK: - Public Methods

    // MARK: - IBAction

    // MARK: - Private Methods
}

extension NotificationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "StoryCell", for: indexPath) as? StoryCell
            else { fatalError() }
            return cell

        } else if indexPath.row == 2 {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: "RecomendationCell",

                for: indexPath
            ) as? RecomendationCell
            else { fatalError() }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostCell
            else { fatalError() }

            cell.configure(post: posts[indexPath.row])
            return cell
        }
    }
}

extension NotificationViewController: UITableViewDelegate {}

extension NotificationViewController {
    func setupTableView() {
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.widthAnchor.constraint(equalToConstant: 375).isActive = true
    }
}
