//
//  DaftTap_ChallengeTests.swift
//  DaftTap ChallengeTests
//
//  Created by Karol Struniawski on 06/05/2019.
//  Copyright © 2019 Karol Struniawski. All rights reserved.
//

import XCTest
@testable import DaftTap_Challenge

class DaftTap_ChallengeTests: XCTestCase {

    var sut : ViewController!
    var gameSut : GameViewController!
    var dummyResults = DummyScores()

    override func setUp() {
        super.setUp()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        _ = sut.view
    }

    override func tearDown() {
        sut = nil
        dummyResults.delete()
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testIfButtonIsEnabled(){
        XCTAssert(sut.startButton!.isEnabled)
    }

    func testTableViewHaveCorrectNumOfRecords(){
        if sut.results.count == 5{
            XCTAssert(sut.tableView.numberOfRows(inSection: 0) == 5)
        }else{
            XCTAssert(sut.tableView.dataSource == nil)
        }
    }

    func testIfScoresDisplayedCorrectly5(){
        dummyResults.save()
        sut.reloadScores()
        XCTAssert(sut.tableView.numberOfRows(inSection: 0) == 5)
    }

    func testIfScoresDisplayedCorrectly4(){
        dummyResults.results.removeLast()
        dummyResults.save()
        sut.reloadScores()
        XCTAssert(sut.tableView.numberOfRows(inSection: 0) == 4)
    }
}
