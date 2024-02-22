// Post.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Пост
struct Post {
    /// Никнейм
    let nickname: String
    /// Аватар
    let photo: UIImage
    /// Массив с картинками для поста
    let pictures: [UIImage]
    /// Время поста
    let timeText: String
}
