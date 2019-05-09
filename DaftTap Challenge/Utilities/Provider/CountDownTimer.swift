//
//  CountDownTimer.swift
//  DaftTap Challenge
//
//  Created by Karol Struniawski on 07/05/2019.
//  Copyright © 2019 Karol Struniawski. All rights reserved.
//

import UIKit

class CountDownTimer{
    private var timer = Timer()
    var interval : Double
    var time : Double
    var label : UILabel
    var finalWord : String
    private var timeRemaining : Double
    var delegate : TriggeringGame?

    init(interval : Double, time : Double, finalWord : String, label : UILabel){
        self.interval = interval
        self.label = label
        self.time = time
        self.timeRemaining = time
        self.finalWord = finalWord
    }

    func play(){
        timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(self.playing), userInfo: nil, repeats: true)
        timer.fire()
    }

    @objc private func playing(){
        if timeRemaining == 0.0{
            label.text = finalWord
            UIView.animate(withDuration: 0.3, animations: {
                self.label.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
                self.label.alpha = 0.0
            }) {_ in
                self.label.isHidden = true
                self.delegate?.triggerGame()
            }
        }else{
            label.text = "\(Int(timeRemaining))"
            UIView.animate(withDuration: 0.1, animations: {
                self.label.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            }) { _ in
                UIView.animate(withDuration: 0.1, animations: {
                    self.label.transform = CGAffineTransform.identity
                })
            }
        }
        timeRemaining -= interval
    }
}
