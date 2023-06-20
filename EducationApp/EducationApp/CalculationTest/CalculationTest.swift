//
//  CalculationTest.swift
//  CalculationTest
//
//  Created by anupriya on 2023-04-26.
//

import XCTest

final class CalculationTest: XCTestCase {

    func testCovertDaysToHours(){
        let sut = CalculateController()
        let actual = sut.convertDaysToHours(noOfDays: 5)
        let except = "120"
        XCTAssertEqual(actual, except)
    }

}
