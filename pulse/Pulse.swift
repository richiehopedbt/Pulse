//
//  Pulse.swift
//  pulse
//
//  Created by Richard Hope on 23/05/2017.
//  Copyright © 2017 Richard Hope. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class DesignableImageView: UIImageView {}
@IBDesignable class DesignableButton: UIButton{}
@IBDesignable class DesignableTextField: UITextField {}
@IBDesignable class DesignableLabel: UILabel {}

class PulseView: UIView {

    enum PulseViewAnimationType : Int {
        case regularPulsing
        case radarPulsing
    }


    let PulseKey: String = "PulseKey"
    let RadarKey: String = "RadarKey"
    let LayerName: String = "LayerName"

    func startPulse(with color: UIColor) {
        startPulse(with: color, scaleFrom: 1.2, to: 1.4, frequency: 1.0, opacity: 0.7, animation:.regularPulsing)
    }
    func startPulse(with color: UIColor, animation animationType: PulseViewAnimationType) {
        let frequency: CGFloat = animationType == .radarPulsing ? 1.5 : 1.0
        let startScale: CGFloat = animationType == .radarPulsing ? 1.0 : 1.2
        startPulse(with: color, scaleFrom: startScale, to: 1.4, frequency: frequency, opacity: 0.7, animation: animationType)
    }

    func startPulse(with color: UIColor, scaleFrom initialScale: CGFloat, to finishScale: CGFloat, frequency: CGFloat, opacity: CGFloat, animation animationType: PulseViewAnimationType) {
        let externalBorder = CALayer()
        externalBorder.frame = frame
        externalBorder.cornerRadius = layer.cornerRadius
        externalBorder.backgroundColor = color.cgColor
        externalBorder.opacity = Float(opacity)
        externalBorder.name = LayerName
        layer.masksToBounds = false
        layer.superlayer?.insertSublayer(externalBorder, below: layer)
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.fromValue = (initialScale)
        scaleAnimation.toValue = (finishScale)
        scaleAnimation.duration = CFTimeInterval(frequency)
        scaleAnimation.autoreverses = animationType == .regularPulsing
        scaleAnimation.repeatCount = Float(INT32_MAX)
        externalBorder.add(scaleAnimation, forKey: PulseKey)
        if animationType == .radarPulsing {
            let opacityAnimation = CABasicAnimation(keyPath: "opacity")
            opacityAnimation.fromValue = (opacity)
            opacityAnimation.toValue = (0.0)
            opacityAnimation.duration = CFTimeInterval(frequency)
            opacityAnimation.autoreverses = false
            opacityAnimation.repeatCount = Float(INT32_MAX)
            externalBorder.add(opacityAnimation, forKey: RadarKey)
        }

    }

    func stopPulse() {
        layer.removeAnimation(forKey: PulseKey)
        layer.removeAnimation(forKey: RadarKey)
        let externalBorderLayer: CALayer? = self.externalBorderLayer()
        if externalBorderLayer != nil {
            externalBorderLayer?.removeFromSuperlayer()
        }
    }
    func externalBorderLayer() -> CALayer? {
        for layer: CALayer in (layer.superlayer?.sublayers!)! {
            if (layer.name == LayerName) {
                return layer
            }
        }
        return nil
    }
    
}

extension PulseView {

    @IBInspectable

    var borderwidth: CGFloat {
        get {
            return layer.borderWidth
        }

        set {
            layer.borderWidth = newValue
        }
    }

    @IBInspectable

    var borderColor: UIColor? {
        get {
            return layer.borderColor != nil ? UIColor(cgColor: layer.borderColor!) : nil
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }

    @IBInspectable

    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue != 0
        }
    }


}

