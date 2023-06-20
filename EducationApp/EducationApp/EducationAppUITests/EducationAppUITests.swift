//
//  EducationAppUITests.swift
//  EducationAppUITests
//
//  Created by anupriya on 2023-04-20.
//

import XCTest
@testable import EducationApp

class EducationAppUITests: XCTestCase {
    
//    func testAddDetails(){
//        //launch the app
//        let app = XCUIApplication()
//        app.launch()
//
//        let addBookVC = AddBookViewController()
//        XCTAssertTrue(addBookVC.isViewLoaded)
//
//        let addButton = app.buttons["Add"]
//        addButton.tap()
//        XCTAssertEqual(DBManager.share.fetchBook().count, 0)
//
//        //Enter the valid data
//
//        let nameTextField = app.textFields["Name"]
//        let priceTextField = app.textFields["Price"]
//        let typeTextField = app.textFields["Type"]
//        let writerTextField = app.textFields["Writer"]
//        let formatTextField = app.textFields["Format"]
//
//        nameTextField.tap()
//        nameTextField.typeText("Book one")
//        priceTextField.tap()
//        priceTextField.typeText("500.00")
//        typeTextField.tap()
//        typeTextField.typeText("Adventure")
//        writerTextField.tap()
//        writerTextField.typeText("ABC")
//        formatTextField.tap()
//
//        let picker = app.pickerWheels.element
//        picker.adjust(toPickerWheelValue: "hardcover")
//
//        addButton.tap()
//        XCTAssertEqual(DBManager.share.fetchBook().count, 1)
//
//        //Enter Invalid data
//        nameTextField.tap()
//        nameTextField.typeText("Invalid data")
//        addButton.tap()
//        XCTAssertEqual(DBManager.share.fetchBook().count, 1)
//
//    }
}
