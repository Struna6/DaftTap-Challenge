//
//  DummyScores.swift
//  DaftTap ChallengeTests
//
//  Created by Karol Struniawski on 07/05/2019.
//  Copyright © 2019 Karol Struniawski. All rights reserved.
//

import Foundation

class DummyScores{
    var results = [Int](repeating: 1, count: 5)

    func save(){
        UserDefaults.standard.set(results, forKey: "results")
    }

    func delete(){
        UserDefaults.standard.removeObject(forKey: "results")
    }
}
