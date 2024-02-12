// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

///  Стартовый экран приложения
class ViewController: UIViewController {
    // MARK: - Types

    // MARK: - Constants

    // MARK: - IBOutlets

    @IBOutlet var thridButton: UIButton!
    @IBOutlet var secondButton: UIButton!
    @IBOutlet var firstButton: UIButton!
    @IBOutlet var thridMusicImageView: UIImageView!
    @IBOutlet var secondMusicImageView: UIImageView!
    @IBOutlet var firstMusicImageView: UIImageView!

    // MARK: - Visual Components

    // MARK: - Public Properties

    // MARK: - Private Properties

    // MARK: - Initializers

    // MARK: - Life Cycle

//        override func viewDidLoad() {
//            super.viewDidLoad()
//        }

    // MARK: - Public Methods

    // MARK: - IBAction

    @IBAction func tapFirstButton(_ sender: Any) {
        performSegue(withIdentifier: "showPlayerViewController", sender: nil)
    }

    @IBAction func tapSecondButton(_ sender: Any) {
        performSegue(withIdentifier: "showPlayerViewController", sender: nil)
    }

    @IBAction func tapThridButton(_ sender: Any) {
        performSegue(withIdentifier: "showPlayerViewController", sender: nil)
    }

    // MARK: - Private Methods
}
