//
//  Score.swift
//  DaftTap Challenge
//
//  Created by Karol Struniawski on 07/05/2019.
//  Copyright © 2019 Karol Struniawski. All rights reserved.
//

import Foundation

class ScoreProvider{
    static private var userDefaultsName = "results"

    static func addAndUpdate(newScore : GameScore){
        var results = [GameScore]()

        if let resultsData = UserDefaults.standard.data(forKey: userDefaultsName){
            results = try! PropertyListDecoder().decode([GameScore].self, from: resultsData)
        }

        results.append(newScore)
        results = results.sorted(){$0.score > $1.score}

        if results.count > 5{
            results.removeLast()
        }
        UserDefaults.standard.removeObject(forKey: userDefaultsName)

        let resultsData = try! PropertyListEncoder().encode(results)
        UserDefaults.standard.set(resultsData, forKey: userDefaultsName)
    }

    static func getScores() -> [GameScore]{
        var results = [GameScore]()

        if let resultsData = UserDefaults.standard.data(forKey: userDefaultsName){
            results = try! PropertyListDecoder().decode([GameScore].self, from: resultsData)
        }

        return results
    }
}
