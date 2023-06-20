//
//  addBookVCTests.swift
//  EducationAppTests
//
//  Created by anupriya on 2023-04-20.
//

import XCTest
@testable import EducationApp
 class addBookVCTests: XCTestCase {
    
    var addBookVC : AddBookViewController!

    override func setUpWithError() throws {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        addBookVC = sb.instantiateViewController(withIdentifier: "AddBookViewController") as? AddBookViewController
        addBookVC.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        addBookVC = nil
    }
    
     func testAddBookWithValidData(){
         
         //Given
         addBookVC.txtName.text = "Snow white"
         addBookVC.txtPrice.text = "500.00"
         addBookVC.txtType.text = "Fantasy"
         addBookVC.txtWriter.text = "bbb"
         addBookVC.formatSelected = "hardcover"
         
         //when
         addBookVC.onClickAdd(UIButton())
         
         //Then
         let book = DBManager.share.fetchBook().last
         XCTAssertEqual(book!.name, "Snow white")
         XCTAssertEqual(book!.price, "500.00")
         XCTAssertEqual(book!.type, "Fantasy")
         XCTAssertEqual(book!.writer,"bbb")
         XCTAssertEqual(book!.format,"hardcover")
         
     }
     
     func testAddBookWithEmptyFields(){
         
         //Given
         addBookVC.txtName.text = ""
         addBookVC.txtPrice.text = ""
         addBookVC.txtType.text = ""
         addBookVC.txtWriter.text = ""
         addBookVC.formatSelected = "paperback"
         
         //when
         addBookVC.onClickAdd(UIButton())
         
         //Then
         let book = DBManager.share.fetchBook().last
         XCTAssertNil(book) //The database shouldn't receive any new books.
     }
}
