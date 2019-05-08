//
//  GameResult.swift
//  DaftTap Challenge
//
//  Created by Karol Struniawski on 08/05/2019.
//  Copyright © 2019 Karol Struniawski. All rights reserved.
//

import Foundation

struct GameResult : Comparable{
    static func < (lhs: GameResult, rhs: GameResult) -> Bool {
        return lhs.score < rhs.score
    }

    var score : Int
    var date : Date


}
