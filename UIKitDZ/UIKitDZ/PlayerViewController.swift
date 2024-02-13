// PlayerViewController.swift
// Copyright © RoadMap. All rights reserved.

import AVFoundation
import Foundation
import UIKit

/// Экран плеера
final class PlayerViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet var nextTrack: UIButton!
    @IBOutlet var previousTrack: UIButton!
    @IBOutlet var volumeSlider: UISlider!
    @IBOutlet var backButton: UIButton!
    @IBOutlet var sliderMusic: UISlider!
    @IBOutlet var playStopImageView: UIImageView!
    @IBOutlet var titleMusic: UILabel!
    @IBOutlet var groupMusic: UILabel!
    @IBOutlet var logoImageView: UIImageView!

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

    @IBAction func changeSlider(_ sender: UISlider) {
        player.currentTime = TimeInterval(sender.value)
    }

    @IBAction func changeVolumeSlider(_ sender: Any) {
        player.volume = volumeSlider.value
    }

    @IBAction func tapBackButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func tapPlayStopButton(_ sender: Any) {
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

    @IBAction func nextTrack(_ sender: Any) {
        currentTrackIndex += 1
        if currentTrackIndex >= tracks.count {
            currentTrackIndex = 0
        }
        let nextTrack = tracks[currentTrackIndex]
        logoImageView.image = UIImage(named: logos[currentTrackIndex])
        titleMusic.text = tracks[currentTrackIndex]
        groupMusic.text = "The Beatles"
        setMusic(nextTrack)
    }

    @IBAction func previousTrack(_ sender: Any) {
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
        titleMusic.text = music
        groupMusic.text = group

        setMusic(music ?? "")

        player.play()
    }

    private func setMusic(_ music: String) {
        do {
            if let audioPath = Bundle.main.path(forResource: music, ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                sliderMusic.maximumValue = Float(player.duration)
            }
        } catch {
            print("errror")
        }
    }
}
