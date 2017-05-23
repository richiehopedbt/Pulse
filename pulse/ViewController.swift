//
//  ViewController.swift
//  pulse
//
//  Created by Richard Hope on 23/05/2017.
//  Copyright © 2017 Richard Hope. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var box: PulseView!
    @IBOutlet weak var box2: PulseView!

    override func viewDidLoad() {

        box.startPulse(with: .red, scaleFrom: 1.0, to: 2.0, frequency: 1.0, opacity: 0.5, animation: .radarPulsing)
        box2.startPulse(with: .blue, scaleFrom: 1.0, to: 2.0, frequency: 1.0, opacity: 0.5, animation: .radarPulsing)


    }

}


