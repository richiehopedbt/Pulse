# Pulse
A pulsing view

![Version](https://img.shields.io/badge/Release-v1-Red.svg)
![Swift 3](https://img.shields.io/badge/Swift-3.x-orange.svg)
![XCode - 8](https://img.shields.io/badge/XCode%20Version-8%20-red.svg)
![platforms](https://img.shields.io/badge/platforms-iOS%20-lightgrey.svg)
[![Scrutinizer Build](https://img.shields.io/scrutinizer/build/g/filp/whoops.svg?maxAge=2592000)]()

## Pulse is a UIView that can pulse in two ways.
To add it to your project simply copy the pulse.swift file to your project, create a view in interface builder and then change the class to a Pulse class in the Identity Inspector.

Included in this repository is an example app that shows the two variants of the pulse.

to animate the pulse simply use this code. If you are wanting this pulse to happen every time the particular ViewController is seen you will need to put this code in 'ViewWillAppear' and not 'ViewDidLoad':

red circle:
`viewToPulse.startPulse(with: .red, scaleFrom: 1.0, to: 2.0, frequency: 1.0, opacity: 0.5, animation: .radarPulsing)`

blue circle:
` viewToPulse.startPulse(with: .blue, scaleFrom: 1.0, to: 1.5, frequency: 0.5, opacity: 0.1, animation: .regularPulsing)`

![Chat Preview](https://github.com/richiehopedbt/Pulse/blob/Beta/pulse.gif) 
