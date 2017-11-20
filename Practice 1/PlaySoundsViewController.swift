//
//  PlaySoundsViewController.swift
//  Practice 1
//
//  Created by Apple on 18/11/17.
//  Copyright © 2017 Wipro. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

   
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!

    var recordedAudioURL:URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int {
        case chipmunk=0, vader=1
    }
    
    @IBAction func playSoundForButton(_ sender: UIButton) {
        switch(ButtonType(rawValue: sender.tag)!) {
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch: -1000)
        }
        configureUI(.playing)
    }
    
    @IBAction func stopButtonPressed(_ sender: Any) {
         stopAudio()
         print("Recording Stopped")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureUI(.notPlaying)
    }
}
