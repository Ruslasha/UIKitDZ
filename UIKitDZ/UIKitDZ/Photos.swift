// Photos.swift
// Copyright © RoadMap. All rights reserved.

/// fg
struct Photos {
    static func allPhotos() -> [Photo] {
        [
            Photo(imageName: "firstPhoto"),
            Photo(imageName: "secondPhoto"),
            Photo(imageName: "threePhoto"),
            Photo(imageName: "fourPhoto"),
            Photo(imageName: "fivePhoto"),
            Photo(imageName: "sixPhoto"),
            Photo(imageName: "sevenPhoto"),
            Photo(imageName: "eightPhoto"),
            Photo(imageName: "ninePhoto")
        ]
    }
}

/// fg
struct Photo {
    let imageName: String
}
