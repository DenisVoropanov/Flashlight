//
//  ViewController.swift
//  The Light
//
//  Created by Alexandra Popova on 09.11.2021.
//

import UIKit
var Light:Bool = false

class ViewController: UIViewController {
    @IBOutlet weak var Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        on_off()
    }

    fileprivate func on_off() {
        view.backgroundColor = Light ? .white : .black
    }
    
    @IBAction func ButtonTap(_ sender: Any) {
        Light.toggle()
        on_off()
    }
    
}

