//
//  ViewController.swift
//  The Light
//
//  Created by Alexandra Popova on 09.11.2021.
//

import AVKit
import UIKit

var countOfTap: Int = 0

class ViewController: UIViewController {
    @IBOutlet weak var Button: UIButton!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        on_off()
    }
    ///  The function helps to change the color of the screen. The color depends on the number of touches on the screen.
    fileprivate func on_off() {
        switch countOfTap {
        case 0:
            view.backgroundColor = .red
        case 1:
            view.backgroundColor = .orange
        case 2:
            view.backgroundColor = .yellow
        case 3:
            view.backgroundColor = .green
        case 4:
            view.backgroundColor = .cyan
        case 5:
            view.backgroundColor = .blue
        case 6:
            view.backgroundColor = .magenta
        default:
            countOfTap = -1
        }
    }
    /// The function switches the color in the moment of pressing our button.
    @IBAction func ButtonTap(_ sender: Any) {
        countOfTap += 1
        on_off()
        RealFlash()
    }
    /// The function 
    fileprivate func RealFlash() {
        let device = AVCaptureDevice.default(for: AVMediaType.video)
        if ((device?.hasTorch) != nil) {
            do {
                try device?.lockForConfiguration()
                device?.torchMode = device?.torchMode == AVCaptureDevice.TorchMode.on ? .off : .on
                device?.unlockForConfiguration()
            } catch {print(error)}    }
    }
}

