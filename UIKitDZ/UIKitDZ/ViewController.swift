// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

///  Стартовый экран приложения
final class ViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet var thridGroup: UILabel!
    @IBOutlet var secondGroup: UILabel!
    @IBOutlet var firstGroup: UILabel!
    @IBOutlet var thridTitle: UILabel!
    @IBOutlet var secondTitle: UILabel!
    @IBOutlet var firstTitle: UILabel!
    @IBOutlet var thridButton: UIButton!
    @IBOutlet var secondButton: UIButton!
    @IBOutlet var firstButton: UIButton!
    @IBOutlet var thridMusicImageView: UIImageView!
    @IBOutlet var secondMusicImageView: UIImageView!
    @IBOutlet var firstMusicImageView: UIImageView!

    // MARK: - Public Methods

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPlayerViewController" {
            if let destinationVC = segue.destination as? PlayerViewController {
                if let data = sender as? (UIImage?, String?, String?) {
                    destinationVC.logoImage = data.0
                    destinationVC.music = data.1
                    destinationVC.group = data.2
                }
            }
        }
    }

    // MARK: - IBAction

    @IBAction func tapFirstButton(_ sender: Any) {
        performSegue(
            withIdentifier: "showPlayerViewController",

            sender: (firstMusicImageView.image, firstTitle.text, firstGroup.text)
        )
    }

    @IBAction func tapSecondButton(_ sender: Any) {
        performSegue(
            withIdentifier: "showPlayerViewController",

            sender: (secondMusicImageView.image, secondTitle.text, secondGroup.text)
        )
    }

    @IBAction func tapThridButton(_ sender: Any) {
        performSegue(
            withIdentifier: "showPlayerViewController",

            sender: (thridMusicImageView.image, thridTitle.text, thridGroup.text)
        )
    }
}
