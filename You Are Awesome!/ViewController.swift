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

        var newIndex: Int // declares but doesn't initialize newIndex
        
        //SHOW MESSAGE
        repeat {
            newIndex = Int.random(in: 0..<messages.count)
        } while index == newIndex
        
        index = newIndex
        messageLabel.text = messages[index]
        
        //SHOW IMAGE
        repeat {
            newIndex = Int.random(in: 0..<numberOfImages)
        } while imageIndex == newIndex
        
        imageIndex = newIndex
        
        
        awesomeImageView.image = UIImage(named: "image\(imageIndex)")
    
        //Get Random Number for a Sound
        
        repeat {
            newIndex = Int.random(in: 0..<numberOfSounds)
        } while soundIndex == newIndex
        
        soundIndex = newIndex
        
        //PLAY SOUND
        
        var soundName = "sound\(soundIndex)"
        
        
            //Can we load the file sound name?
        if let sound = NSDataAsset(name: soundName){
            //check if sound.data is a sound file
            
            do {
                try awesomePlayer = AVAudioPlayer(data: sound.data)
                awesomePlayer.play()
            } catch {
                //if sound.data is not a valid audio file
                print("ERROR: data in \(soundName) couldn't be played as a sound.")
            }
            
        } else  {
            //if reading in the NSDataAsset doesn't work, tell the developer-report the error
            print("ERROR: File \(soundName) didn't load")
        }
        
        
    }
    
}

