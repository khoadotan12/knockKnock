//
//  ViewController.swift
//  BullsEye
//
//  Created by Đỗ Tấn Khoa on 3/16/19.
//  Copyright © 2019 Đỗ Tấn Khoa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue = 0
    @IBOutlet weak var slider: UISlider!
    var targetValue = 0
    var score = 0
    var round = 0
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startNewRound()
    }
    
    @IBAction func showHitMeAlert() {
        let difference = abs(currentValue - targetValue)
        let points = 100 - difference
        score += points
        
        let title: String
        if (difference == 0) {
            title = "Perfect!"
        } else if (difference < 5) {
            title = "You almost had it!"
        } else if (difference < 10) {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        
        let message = "You scored \(points) points"
        let alert = UIAlertController(title: title, message:  message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true)
        startNewRound()
    }
    
    @IBAction func sliderMoved(slider: UISlider) {
        currentValue = Int(slider.value.rounded())
    }
    
    func startNewRound() {
        round += 1
        currentValue = 50
        slider.value = Float(currentValue)
        targetValue = Int.random(in: 1...100)
        updateLabels()
    }
    
    func updateLabels() {
        scoreLabel.text = String(score)
        targetLabel.text = String(targetValue)
        roundLabel.text = String(round)
    }
    
}

