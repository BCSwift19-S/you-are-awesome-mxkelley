//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by Michael X Kelley on 1/7/19.
//  Copyright © 2019 Michael X Kelley. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var awesomeImageView: UIImageView!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    var awesomePlayer = AVAudioPlayer()
    
    
    var index = -1
    var imageIndex = -1
    let numberOfImages = 10
    var soundIndex = -1
    let numberOfSounds = 6
    
    // Code below executes when the app's view first loads.
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func nonRepeatingRandom(lastNumber: Int, maxValue: Int) -> Int {
        var newIndex: Int
        repeat {
            newIndex = Int.random(in: 0..<maxValue)
        } while lastNumber == newIndex
        return newIndex
    }
    
    
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer) {
        //Can we load the file sound name?
        if let sound = NSDataAsset(name: soundName){
            //check if sound.data is a sound file
            
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                //if sound.data is not a valid audio file
                print("ERROR: data in \(soundName) couldn't be played as a sound.")
            }
            
        } else  {
            //if reading in the NSDataAsset doesn't work, tell the developer-report the error
            print("ERROR: File \(soundName) didn't load")
        }
        
    }
    
   
    

    @IBAction func showMessagePressed(_ sender: UIButton) {
        
        let messages = ["You Are Awesome!",
                        "You Are Great!",
                        "You Are Fantastic!",
                        "When the Genius Bar needs help, they call you!",
                        "You Brighten My Day!",
                        "You Make Me Smile!",
                        "You Are Da Bomb!",
                        "Hey Fabulous!",
                        "You Are Tremendous!",
                        "You have the design skills of Jony Ive!",
                        "I can't wait to download you're app!"]
        
        //SHOW MESSAGE
        
        index = nonRepeatingRandom(lastNumber: index, maxValue: messages.count)
        messageLabel.text = messages[index]
        
        //SHOW IMAGE
       
        imageIndex = nonRepeatingRandom(lastNumber: imageIndex, maxValue: numberOfImages)
        awesomeImageView.image = UIImage(named: "image\(imageIndex)")
    
        //Get Random Number for a Sound
        
        soundIndex = nonRepeatingRandom(lastNumber: soundIndex, maxValue: numberOfSounds)

        //PLAY SOUND
        
        let soundName = "sound\(soundIndex)"
        playSound(soundName: soundName, audioPlayer: &awesomePlayer)
        
        
    }
    
}

