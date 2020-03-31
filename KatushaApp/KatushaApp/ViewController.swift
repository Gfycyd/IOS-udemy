//
//  ViewController.swift
//  KatushaApp
//
//  Created by Katya Uzbekova on 08/06/2019.
//  Copyright © 2019 Katya Uzbekova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var rounds = 0

    
    @IBOutlet weak var slider:UISlider!
    @IBOutlet weak var valueGuess:UILabel!
    @IBOutlet weak var Score:UILabel!
    @IBOutlet weak var roundLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        targetValue = Int.random(in: 1...100)
        resetGame()
        
        let thumbImage = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImage, for: .normal)
        
        let thumbImageHig = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHig, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let leftTrackImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let leftResize = leftTrackImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(leftResize, for: .normal)
        
        let rightTrackImage = #imageLiteral(resourceName: "SliderTrackRight")
        let rightResize = rightTrackImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(rightResize, for: .normal)
        
        
        
    }

    @IBAction func showAlert(){
        let difference = abs(targetValue-currentValue)
        var points = 100 - difference
       
        let title:String
        if difference == 0{
            title = "Perfect!"
            points += 100
        }
        else if difference < 5{
            title = "You almost had it"
            if difference == 1{
                points += 50
            }
        }
        else if difference < 20{
            title = "Pretty good!"
        }
        else {
            title = "Not even close..."
        }
        score += points
        let message = "Your score is \(points)"
        let alert = UIAlertController(title: title , message: message , preferredStyle: .alert)
    
        let action = UIAlertAction(title: "Awesome", style: .default, handler: {
            action in
            self.startNewRound()
        })
        alert.addAction(action)
        present(alert,animated: true, completion: nil)
    }
    
    @IBAction func resetGame(){
        rounds = 0
        score = 0
        startNewRound()
    }
    @IBAction func sliderMoved(slider: UISlider)
    {
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
    func startNewRound(){
        rounds += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
        
    }
    func updateLabels(){
        valueGuess.text = String(targetValue)
        Score.text = String(score)
        roundLabel.text = String(rounds)

    }

}

