//
//  Score.swift
//  DaftTap Challenge
//
//  Created by Karol Struniawski on 07/05/2019.
//  Copyright © 2019 Karol Struniawski. All rights reserved.
//

import Foundation

class ScoreProvider{

    static func addAndUpdate(newScore : GameResult){
        var results = UserDefaults.standard.array(forKey: "results") as? [GameResult] ?? [GameResult]()
        results.append(newScore)
        results = results.sorted(by: >)

        while results.count > 5{
            results.removeLast()
        }

        UserDefaults.standard.removeObject(forKey: "results")
        UserDefaults.standard.set(results, forKey: "results")
    }
    
}
