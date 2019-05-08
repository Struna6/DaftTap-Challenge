//
//  GameVC_Tests.swift
//  DaftTap ChallengeTests
//
//  Created by Karol Struniawski on 07/05/2019.
//  Copyright © 2019 Karol Struniawski. All rights reserved.
//

import XCTest
@testable import DaftTap_Challenge

class GameVC_Tests : XCTestCase {

    var sut : GameViewController!
    var dummyResults = DummyScores()

    override func setUp() {
        super.setUp()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "GameViewController") as? GameViewController
        _ = sut.view
    }

    override func tearDown() {
        sut = nil
        dummyResults.delete()
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCounterOnBegin(){
        XCTAssert(sut.counterTimeBefore.text == "3")
    }

}
