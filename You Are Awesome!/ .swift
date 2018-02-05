//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by Victoria LePore on 1/18/18.
//  Copyright © 2018 Victoria LePore. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
   
    // MARK: - Properties
    
    @IBOutlet weak var messageLabel: UILabel!
    var index = -1
    @IBOutlet weak var awesomeImage: UIImageView!
    @IBOutlet weak var soundSwitch: UISwitch!
    var awesomePlayer = AVAudioPlayer()
    var imageNumber = -1
    var soundNumber = -1
    var soundName = " "
    let numberOfImages = 10
    let numberOfSounds = 5
    
    
    //Code below executes when the view controller loads
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - My Own Functions
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer) {
        //Can we load in the file soundName?
        if let sound = NSDataAsset(name: soundName) {
            //Check if sound.data is a sound file
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                // if sound.data is not a valid audio file
                print("ERROR: data in \(soundName) couldn't be played as a sound.")
            }
        } else {
            //if readindg in the NSDataAsset didn't work, tell the user/ report the error.
            print("ERROR: file \(soundName) didn't load.")
        }
    }
    
    func nonRepeatingRandom(lastNumber: Int, maxValue: Int) -> Int {
        var newIndex = -1
        repeat {
            newIndex = Int(arc4random_uniform(UInt32(maxValue)))
        } while lastNumber == newIndex
        
        return newIndex
    }
    
    // MARK: - Actions
    
    @IBAction func soundSwitchPressed(_ sender: UISwitch) {
        if !soundSwitch.isOn && soundNumber != -1 {
            //stop playing
            awesomePlayer.stop()
        }
    }                   
    
    @IBAction func showMessagePressed(_ sender: UIButton) {
        
        let messages = ["You Are Fantastic!",
                        "You Are Great!",
                        "You Are Amazing!",
                        "When the Genius Bar needs help, they call you!",
                        "You Brighten My Day!",
                        "You Are Da Bomb!",
                        "I can't wait to use your app!",
                        "Fabulous? That's You!"]
        
//        for message in messages {
//            message
//        }
//
//        for indexOfMessage in 0..<messages.count {
//            let message = messages[indexOfMessage]
//
//        }
        
        //Show a message
        index = nonRepeatingRandom(lastNumber: index, maxValue: messages.count)
        messageLabel.text = messages[index]
        
        //Show an image
        awesomeImage.isHidden = false
        imageNumber = nonRepeatingRandom(lastNumber: imageNumber, maxValue: numberOfImages)
        awesomeImage.image = UIImage(named: "image\(imageNumber)")
       
        if soundSwitch.isOn {
            //Get a random number to use in our soundName file
            soundNumber = nonRepeatingRandom(lastNumber: soundNumber, maxValue: numberOfSounds)
            //Play a sound
            let soundName = "sound\(soundNumber)"
            playSound(soundName: soundName, audioPlayer: &awesomePlayer)
        }
        
        
        
//        var newIndex = Int(arc4random_uniform(UInt32(messages.count)))
//
//        while index == newIndex {
//            newIndex = Int(arc4random_uniform(UInt32(messages.count)))
//        }
//
//        index = newIndex
//        messageLabel.text = messages[index]
        
        
        
        
        
//        var randomIndex =
//            Int(arc4random_uniform(UInt32(messages.count)))
//        messageLabel.text = messages[randomIndex]
        
        
        
        
//        messageLabel.text = messages[index]
//        index = index + 1
//
//        if index == messages.count {
//            index = 0
//        }
       
// index += 1 is another way to write index = index + 1
        
        
        

//        let message1 = "You Are Awesome!"
//        let message2 = "You Are Great!"
//        let message3 = "You Are Amazing!"
//
//        if messageLabel.text == message1 {
//            messageLabel.text = message2
//        } else if messageLabel.text == message2{
//            messageLabel.text = message3
//        } else {
//            messageLabel.text = message1
// }

}
        
}
