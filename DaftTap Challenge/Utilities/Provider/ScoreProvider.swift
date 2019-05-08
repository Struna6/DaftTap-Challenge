//
//  Score.swift
//  DaftTap Challenge
//
//  Created by Karol Struniawski on 07/05/2019.
//  Copyright © 2019 Karol Struniawski. All rights reserved.
//

import Foundation

class ScoreProvider{
    static var userDefaultsName = "results"

    static func addAndUpdate(newScore : (date: String, score: Int)){

        if var results = UserDefaults.standard.array(forKey: userDefaultsName) as? [(date : String, score : Int)]{
            results.updateValue(newScore.score, forKey: newScore.date)
            var sortedResults = results.sorted(){$1.value > $0.value}

            while sortedResults.count > 5{
                sortedResults.removeLast()
            }

            UserDefaults.standard.removeObject(forKey: userDefaultsName)
            UserDefaults.standard.set(sortedResults, forKey: userDefaultsName)
        }else{
            let results = [newScore.date : newScore.score]

            UserDefaults.standard.removeObject(forKey: userDefaultsName)
            UserDefaults.standard.set(results, forKey: userDefaultsName)
        }
    }
    
}
