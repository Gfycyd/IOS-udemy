//
//  ViewController.swift
//  Dices
//
//  Created by Katya Uzbekova on 21/09/2019.
//  Copyright © 2019 Katya Uzbekova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var randomDiceIndex: Int = 0
    var randomDiceIndex2: Int = 0
    var randomDiceIndex3: Int = 0
    let myImages = ["dice1", "dice2", "dice3", "dice4","dice5", "dice6"]
    @IBOutlet weak var diceImageView2: UIImageView!
    @IBOutlet weak var diceImageView3: UIImageView!
    @IBOutlet weak var diceImageView1: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDiceImages()
        // Do any additional setup after loading the view.
    }

    @IBAction func rollButton(_ sender: Any) {
       updateDiceImages()
    }
    
    func updateDiceImages(){
        randomDiceIndex = Int.random(in: 0 ... 5)
        randomDiceIndex2 = Int.random(in: 0 ... 5)
        randomDiceIndex3 =  Int.random(in: 0 ... 5)
        
        diceImageView1.image = UIImage(named: myImages[randomDiceIndex])
        diceImageView2.image = UIImage(named: myImages[randomDiceIndex2])
        diceImageView3.image = UIImage(named: myImages[randomDiceIndex3])
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateDiceImages()
    }
    
}

