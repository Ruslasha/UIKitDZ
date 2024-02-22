// PostCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка таблицы с постом
final class PostCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let myPhoto = "myPhoto"
        static let turPhoto = "turPhoto"
        static let naturePicture = "naturePicture"
        static let heartImage = "heart"
        static let tenMinutesText = "10 минут назад"
        static let commentText = "Комментировать..."
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

    // MARK: - Visual Components

    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.myPhoto)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let nicknameLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.myNickname
        label.font = Constants.verdanaBold12
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let likesLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.likesText
        label.font = Constants.verdanaBold10
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.descriptionText
        label.font = Constants.verdana10
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let turPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.turPhoto)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let turNicknameLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.myNickname
        label.font = Constants.verdanaBold12
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let heartImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.heartImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let commentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.commentImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let exportImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.exportImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let saveImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.saveImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let commentLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.commentText
        label.font = Constants.verdanaBold10
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let timeLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.tenMinutesText
        label.font = Constants.verdanaBold10
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let imagePageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.addTarget(nil, action: #selector(pageControlDidChange), for: .valueChanged)
        return pageControl
    }()

    private let imageScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public Methods

    func configure(post: Post) {
        turNicknameLabel.text = post.nickname
        turPhotoImageView.image = post.photo
        timeLabel.text = post.timeText
        configureImagePageControll(post)
    }

    // MARK: - Private Methods

    private func configurePhotoAndNickname() {
        contentView.addSubview(turPhotoImageView)
        turPhotoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        turPhotoImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12).isActive = true
        turPhotoImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        turPhotoImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true

        contentView.addSubview(turNicknameLabel)
        turNicknameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        turNicknameLabel.leftAnchor.constraint(equalTo: turPhotoImageView.rightAnchor, constant: 6).isActive = true
        turNicknameLabel.widthAnchor.constraint(equalToConstant: 107).isActive = true
        turNicknameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

    private func configurePictureAndButtons() {
        contentView.addSubview(imageScrollView)
        imageScrollView.topAnchor.constraint(equalTo: turNicknameLabel.bottomAnchor, constant: 10).isActive = true
        imageScrollView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        imageScrollView.widthAnchor.constraint(equalToConstant: 375).isActive = true
        imageScrollView.heightAnchor.constraint(equalToConstant: 237).isActive = true

        contentView.addSubview(heartImageView)
        heartImageView.topAnchor.constraint(equalTo: imageScrollView.bottomAnchor, constant: 8).isActive = true
        heartImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        heartImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        heartImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true

        contentView.addSubview(commentImageView)
        commentImageView.topAnchor.constraint(equalTo: imageScrollView.bottomAnchor, constant: 8).isActive = true
        commentImageView.leftAnchor.constraint(equalTo: heartImageView.rightAnchor, constant: 8).isActive = true
        commentImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        commentImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true

        contentView.addSubview(exportImageView)
        exportImageView.topAnchor.constraint(equalTo: imageScrollView.bottomAnchor, constant: 10).isActive = true
        exportImageView.leftAnchor.constraint(equalTo: commentImageView.rightAnchor, constant: 8).isActive = true
        exportImageView.widthAnchor.constraint(equalToConstant: 19).isActive = true
        exportImageView.heightAnchor.constraint(equalToConstant: 19).isActive = true

        contentView.addSubview(saveImageView)
        saveImageView.topAnchor.constraint(equalTo: imageScrollView.bottomAnchor, constant: 8).isActive = true
        saveImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -9).isActive = true
        saveImageView.widthAnchor.constraint(equalToConstant: 18).isActive = true
        saveImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }

    private func configureLikesAndTexts() {
        contentView.addSubview(likesLabel)
        likesLabel.topAnchor.constraint(equalTo: heartImageView.bottomAnchor, constant: 6).isActive = true
        likesLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12).isActive = true
        likesLabel.widthAnchor.constraint(equalToConstant: 107).isActive = true
        likesLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true

        contentView.addSubview(descriptionLabel)
        descriptionLabel.topAnchor.constraint(equalTo: likesLabel.bottomAnchor, constant: 6).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12).isActive = true
        descriptionLabel.widthAnchor.constraint(equalToConstant: 361).isActive = true
        descriptionLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true

        contentView.addSubview(avatarImageView)
        avatarImageView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 4).isActive = true
        avatarImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true

        contentView.addSubview(commentLabel)
        commentLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 6).isActive = true
        commentLabel.leftAnchor.constraint(equalTo: avatarImageView.rightAnchor, constant: 3).isActive = true
        commentLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        commentLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true

        contentView.addSubview(timeLabel)
        timeLabel.topAnchor.constraint(equalTo: commentLabel.bottomAnchor, constant: 7).isActive = true
        timeLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12).isActive = true
        timeLabel.widthAnchor.constraint(equalToConstant: 361).isActive = true
        timeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

    private func setupCell() {
        configurePhotoAndNickname()
        configurePictureAndButtons()
        configureLikesAndTexts()
    }

    private func configurePageControllUI(_ post: Post) {
        imagePageControl.numberOfPages = post.pictures.count
        if post.pictures.count < 2 {
            imagePageControl.isHidden = true
        }
        contentView.addSubview(imagePageControl)
        imagePageControl.topAnchor.constraint(equalTo: imageScrollView.bottomAnchor, constant: 10).isActive = true
        imagePageControl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    }

    private func configureImageScrollViewUI(_ post: Post) {
        var xPosition = 0
        for picture in post.pictures {
            let pictureImageView = UIImageView()
            pictureImageView.image = picture
            pictureImageView.frame = CGRect(x: xPosition, y: 0, width: Int(UIScreen.main.bounds.width), height: 237)
            imageScrollView.addSubview(pictureImageView)
            xPosition += Int(UIScreen.main.bounds.width)
            imageScrollView.contentSize = CGSize(width: xPosition, height: 237)
        }
    }

    private func configureImagePageControll(_ post: Post) {
        configurePageControllUI(post)
        configureImageScrollViewUI(post)
    }

    @objc private func pageControlDidChange(_ sender: UIPageControl) {
        let offsetXPosition = UIScreen.main.bounds.width * CGFloat(imagePageControl.currentPage)
        imageScrollView.setContentOffset(CGPoint(x: offsetXPosition, y: 0), animated: true)
    }
}
