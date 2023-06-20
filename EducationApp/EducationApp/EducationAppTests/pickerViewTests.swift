//
//  pickerViewTests.swift
//  EducationAppTests
//
//  Created by anupriya on 2023-04-20.
//

import XCTest
@testable import EducationApp

class pickerViewTests: XCTestCase {

    var pickerTest : AddBookViewController!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        let sb = UIStoryboard(name: "Main", bundle: nil)
        pickerTest = sb.instantiateViewController(withIdentifier: "AddBookViewController") as? AddBookViewController
        pickerTest.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        pickerTest = nil
        try super.tearDownWithError()
    }
    
    func testNumberOfComponentInPicker() {
        //Given
        let pickerView = pickerTest.pickerType
        
        //When
        let numberOfComponents = pickerTest.numberOfComponents(in: pickerView!)
        
        //Then
        XCTAssertEqual(numberOfComponents, 1, "Expected number is 1")
    }
    
    func testNumberOfRowsInPicker(){
        //Given
        let pickerView = pickerTest.pickerType
        
        //When
        let numberOfRows = pickerTest.pickerView(pickerView!, numberOfRowsInComponent: 0)
        
        //Then
        XCTAssertEqual(numberOfRows,4, "Expected number is 4")
    }


}
