//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox

class ViewController: UIViewController, AVAudioPlayerDelegate{
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }



    @IBAction func notePressed(_ sender: UIButton) {
        // for AVFoundation
        playSound(sender.tag)
 
     /*   if let url = Bundle.main.url(forResource: "note7", withExtension: "wav" ) {
            var mySound:SystemSoundID = 0
            AudioServicesCreateSystemSoundID(url as CFURL, &mySound)
            AudioServicesPlaySystemSound(mySound)
        }
 */
        
    }
    
    
    func playSound(_ tag: Int){
        let url = Bundle.main.url(forResource: "note"+String(tag), withExtension: "wav" )!
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            //guard let audioPlayer = audioPlayer else {return}
            //audioPlayer.prepareToPlay()
        }
        catch {
            print(error)
        }
        audioPlayer.play()

    }
  

}

