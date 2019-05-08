//
//  CountDownInGame.swift
//  DaftTap Challenge
//
//  Created by Karol Struniawski on 07/05/2019.
//  Copyright © 2019 Karol Struniawski. All rights reserved.
//

import UIKit

class CountDownInGame{
    private var timer = Timer()
    var interval : Double
    var time : Double
    var label : UILabel
    private var timeRemaining : Double
    var delegate : TriggeringEndGame?

    init(interval : Double, time : Double, label : UILabel){
        self.interval = interval
        self.label = label
        self.time = time
        self.timeRemaining = time
    }

    func play(){
        timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(self.playing), userInfo: nil, repeats: true)
        timer.fire()
    }

    @objc private func playing(){
        label.text = String(format: "%.1f", timeRemaining)

        if timeRemaining.isLess(than: 0.1){
            timer.invalidate()
            self.delegate?.triggerEndGame()
        }
        
        timeRemaining -= interval
    }
}
