//
//  ViewController.swift
//  woz animate
//
//  Created by Preszko on 15.10.2019.
//  Copyright © 2019 Preszko. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet var frontWheel: UIImageView!
    @IBOutlet var rearWheel: UIImageView!
    var bombSoundEffect: AVAudioPlayer?
    
    override func viewDidLoad() {
            rotate(imageView: frontWheel, aCircleTime: 1)
            rotate(imageView: rearWheel, aCircleTime: 1)
        let path = Bundle.main.path(forResource: "knight.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            bombSoundEffect = try AVAudioPlayer(contentsOf: url)
            bombSoundEffect?.play()
        } catch {
            // couldn't load file :(
        }
      
        
    }
    func rotate(imageView: UIImageView, aCircleTime: Double) { //CAKeyframeAnimation
        
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.fromValue = 0.0
        rotationAnimation.toValue = -Double.pi * 2 //Minus can be Direction
        rotationAnimation.duration = aCircleTime
        rotationAnimation.repeatCount = .infinity
        imageView.layer.add(rotationAnimation, forKey: nil)
    }
    
//    func rotate() {
//    UIView.animate(withDuration: 5.0, animations: {
//    self.frontWheel.transform = CGAffineTransform(rotationAngle: (999.0 * .pi) / 1)
//    })
//
//
//    }
}
