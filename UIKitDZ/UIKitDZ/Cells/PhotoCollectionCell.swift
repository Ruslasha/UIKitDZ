// PhotoCollectionCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка таблицы с коллекцией фотографий
final class PhotoCollectionCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let photoCell = "PhotoCell"
    }

    // MARK: - Visual Components

    private var photoCollectionView: UICollectionView!

    // MARK: - Private Properties

    private let photos: [Photo] = Photos.allPhotos()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCollectionView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func setupCollectionView() {
        photoCollectionView = UICollectionView(frame: .zero, collectionViewLayout: setupFlowLayout())
        photoCollectionView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(photoCollectionView)
        photoCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        photoCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        photoCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        photoCollectionView.widthAnchor.constraint(equalToConstant: 375).isActive = true
        photoCollectionView.heightAnchor.constraint(equalToConstant: 375).isActive = true
        photoCollectionView.dataSource = self
        photoCollectionView.register(PhotoCell.self, forCellWithReuseIdentifier: Constants.photoCell)
    }

    private func setupFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: 124, height: 124)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 1
        return layout
    }
}

// MARK: - UICollectionViewDataSource

extension PhotoCollectionCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Constants.photoCell,
            for: indexPath
        ) as?
            PhotoCell else { return UICollectionViewCell() }

        cell.photoImageView.image = UIImage(named: photos[indexPath.item].imageName)
        return cell
    }
}
