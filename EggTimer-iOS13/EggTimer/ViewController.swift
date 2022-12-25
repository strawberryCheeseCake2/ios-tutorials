//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import AVFoundation
import UIKit

class ViewController: UIViewController {
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 5]
    var timer: Timer = .init()
    var totalTime: Int = 0
    var secondsPassed: Int = 0
    
    var player: AVAudioPlayer!
    
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var titleLable: UILabel!
    @IBAction func hardnessSelcted(_ sender: UIButton) {
        timer.invalidate()
        let hardness: String = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        secondsPassed = 0
        progressBar.progress = 0.0
        titleLable.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounter() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            let percentageProgress: Float = .init(secondsPassed) / Float(totalTime)
            progressBar.progress = percentageProgress
        } else {
            timer.invalidate()
            playSound()
            titleLable.text = "Done!"
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
