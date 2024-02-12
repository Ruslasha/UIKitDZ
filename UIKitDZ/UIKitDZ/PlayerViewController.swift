// PlayerViewController.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit

/// Экран плеера
class PlayerViewController: UIViewController {
    // MARK: - Types

    // MARK: - Constants

    // MARK: - IBOutlets

    @IBOutlet weak var titleMusic: UILabel!
    @IBOutlet weak var LogoImageView: UIImageView!
    // MARK: - Visual Components

    // MARK: - Public Properties

    var logoImage: UIImage?
    var music: String?

    // MARK: - Private Properties

    // MARK: - Initializers

    // MARK: - Life Cycle

    override func viewDidLoad() {
            super.viewDidLoad()
            
        LogoImageView.image = image
        titleMusic.text = labelText
        }

    // MARK: - Public Methods

    // MARK: - IBAction

    // MARK: - Private Methods
}
