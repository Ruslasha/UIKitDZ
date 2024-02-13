// TracklistViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

///  Стартовый экран приложения со списком треков
final class TracklistViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet private var thridGroupLabel: UILabel!
    @IBOutlet private var secondGroupLabel: UILabel!
    @IBOutlet private var firstGroupLabel: UILabel!
    @IBOutlet private var thridTitleLabel: UILabel!
    @IBOutlet private var secondTitleLabel: UILabel!
    @IBOutlet private var firstTitleLabel: UILabel!
    @IBOutlet private var thridButton: UIButton!
    @IBOutlet private var secondButton: UIButton!
    @IBOutlet private var firstButton: UIButton!
    @IBOutlet private var thridMusicImageView: UIImageView!
    @IBOutlet private var secondMusicImageView: UIImageView!
    @IBOutlet private var firstMusicImageView: UIImageView!

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

    @IBAction func firstButtonTapped(_ sender: Any) {
        performSegue(
            withIdentifier: "showPlayerViewController",

            sender: (firstMusicImageView.image, firstTitleLabel.text, firstGroupLabel.text)
        )
    }

    @IBAction func secondButtonTapped(_ sender: Any) {
        performSegue(
            withIdentifier: "showPlayerViewController",

            sender: (secondMusicImageView.image, secondTitleLabel.text, secondGroupLabel.text)
        )
    }

    @IBAction func thridButtonTapped(_ sender: Any) {
        performSegue(
            withIdentifier: "showPlayerViewController",

            sender: (thridMusicImageView.image, thridTitleLabel.text, thridGroupLabel.text)
        )
    }
}
