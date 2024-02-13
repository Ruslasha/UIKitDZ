// BirthdayReminderViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран со списком дней рождений
final class BirthdayReminderViewController: UIViewController {
    // MARK: - Visual Components

    private let helenaImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 20, y: 105, width: 75, height: 75))
        imageView.image = UIImage(named: "HelenaAvatar")
        imageView.clipsToBounds = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let helenaLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 102, y: 119, width: 209, height: 20))
        label.text = "Helena link"
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()

    private let helenaDateLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 102, y: 147, width: 209, height: 20))
        label.text = "10.03 - turns 25!"
        label.font = .systemFont(ofSize: 14)
        return label
    }()

    private let helenaDaysImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 314, y: 119, width: 44, height: 44))
        imageView.image = UIImage(named: "Cake")
        imageView.clipsToBounds = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let veronaImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 20, y: 200, width: 75, height: 75))
        imageView.image = UIImage(named: "VeronaAvatar")
        imageView.clipsToBounds = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let veronaLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 102, y: 214, width: 209, height: 20))
        label.text = "Verona link"
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()

    private let veronaDateLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 102, y: 242, width: 209, height: 20))
        label.text = "20.03 - turns 39"
        label.font = .systemFont(ofSize: 14)
        return label
    }()

    private let veronaDaysImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 314, y: 214, width: 44, height: 44))
        imageView.image = UIImage(named: "10days")
        imageView.clipsToBounds = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let alexImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 20, y: 295, width: 75, height: 75))
        imageView.image = UIImage(named: "AlexAvatar")
        imageView.clipsToBounds = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let alexLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 102, y: 309, width: 209, height: 20))
        label.text = "Alex link"
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()

    private let alexDateLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 102, y: 337, width: 209, height: 20))
        label.text = "21.04 - turns 51"
        label.font = .systemFont(ofSize: 14)
        return label
    }()

    private let alexDaysImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 314, y: 309, width: 44, height: 44))
        imageView.image = UIImage(named: "42days")
        imageView.clipsToBounds = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let tomImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 20, y: 390, width: 75, height: 75))
        imageView.image = UIImage(named: "TomAvatar")
        imageView.clipsToBounds = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let tomLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 102, y: 404, width: 209, height: 20))
        label.text = "Verona link"
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()

    private let tomDateLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 102, y: 432, width: 209, height: 20))
        label.text = "05.06 - turns 18"
        label.font = .systemFont(ofSize: 14)
        return label
    }()

    private let tomDaysImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 314, y: 404, width: 44, height: 44))
        imageView.image = UIImage(named: "87days")
        imageView.clipsToBounds = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    // MARK: - Private Methods

    private func setUI() {
        view.backgroundColor = .white
        navigationItem.title = "Birthday Reminder"
        view.addSubview(helenaImageView)
        view.addSubview(veronaImageView)
        view.addSubview(alexImageView)
        view.addSubview(tomImageView)
        view.addSubview(helenaLabel)
        view.addSubview(veronaLabel)
        view.addSubview(alexLabel)
        view.addSubview(tomLabel)
        view.addSubview(helenaDateLabel)
        view.addSubview(veronaDateLabel)
        view.addSubview(alexDateLabel)
        view.addSubview(tomDateLabel)
        view.addSubview(helenaDaysImageView)
        view.addSubview(veronaDaysImageView)
        view.addSubview(alexDaysImageView)
        view.addSubview(tomDaysImageView)
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem = button
    }

    @objc private func addButtonTapped() {
        let nextViewController = NewPersonViewController()
        present(nextViewController, animated: true, completion: nil)
    }
}
