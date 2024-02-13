// PlayerViewController.swift
// Copyright © RoadMap. All rights reserved.

import AVFoundation
import UIKit

/// Экран плеера
final class PlayerViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet private var nextTrackButton: UIButton!
    @IBOutlet private var previousTrackButton: UIButton!
    @IBOutlet private var volumeSlider: UISlider!
    @IBOutlet private var backButton: UIButton!
    @IBOutlet private var trackTimeSlider: UISlider!
    @IBOutlet private var playStopImageView: UIImageView!
    @IBOutlet private var titleTrackLabel: UILabel!
    @IBOutlet private var groupTrackLabel: UILabel!
    @IBOutlet private var logoImageView: UIImageView!

    // MARK: - Public Properties

    var logoImage: UIImage?
    var music: String?
    var group: String?

    // MARK: - Private Properties

    private var player = AVAudioPlayer()
    private var isMusicPlayed = true
    private let tracks = ["Let it be", "Yesterday"]
    private let logos = ["Image1", "Image2"]
    private var currentTrackIndex = 0

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    }

    // MARK: - IBAction

    @IBAction private func timeTrackChanged(_ sender: UISlider) {
        player.currentTime = TimeInterval(sender.value)
    }

    @IBAction private func volumeSliderChanged(_ sender: Any) {
        player.volume = volumeSlider.value
    }

    @IBAction private func backButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction private func playStopButtonTapped(_ sender: Any) {
        if isMusicPlayed == true {
            player.stop()
            isMusicPlayed = false
            playStopImageView.image = UIImage(named: "play")
        } else {
            player.play()
            isMusicPlayed = true
            playStopImageView.image = UIImage(named: "stop")
        }
    }

    @IBAction private func nextTrackButtonTapped(_ sender: Any) {
        currentTrackIndex += 1
        if currentTrackIndex >= tracks.count {
            currentTrackIndex = 0
        }
        let nextTrack = tracks[currentTrackIndex]
        logoImageView.image = UIImage(named: logos[currentTrackIndex])
        titleTrackLabel.text = tracks[currentTrackIndex]
        groupTrackLabel.text = "The Beatles"
        setMusic(nextTrack)
    }

    @IBAction private func previousTrackButtopTapped(_ sender: Any) {
        currentTrackIndex -= 1
        if currentTrackIndex < 0 {
            currentTrackIndex = tracks.count - 1
        }
        let previousTrack = tracks[currentTrackIndex]
        setMusic(previousTrack)
    }

    // MARK: - Private Methods

    private func setUI() {
        let systemImage = UIImage(systemName: "xmark")
        backButton.setImage(systemImage, for: .normal)

        logoImageView.image = logoImage
        titleTrackLabel.text = music
        groupTrackLabel.text = group

        setMusic(music ?? "")

        player.play()
    }

    private func setMusic(_ music: String) {
        do {
            if let audioPath = Bundle.main.path(forResource: music, ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                trackTimeSlider.maximumValue = Float(player.duration)
            }
        } catch {
            print("errror")
        }
    }
}
