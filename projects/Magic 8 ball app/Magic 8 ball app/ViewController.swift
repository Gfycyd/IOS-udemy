//
//  ViewController.swift
//  Magic 8 ball app
//
//  Created by Katya Uzbekova on 21/09/2019.
//  Copyright © 2019 Katya Uzbekova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var images = ["ball1", "ball2", "ball3", "ball4", "ball5"]
    var imageChange:Int = 0
    @IBOutlet weak var imageIcon: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        askChanding()
        // Do any additional setup after loading the view.
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        askChanding()
    }

    @IBAction func askButton(_ sender: Any) {
        askChanding()
    }
    func askChanding(){
        imageChange = Int.random(in: 0...4)
        imageIcon.image = UIImage(named: images[imageChange])
    }
    
}

