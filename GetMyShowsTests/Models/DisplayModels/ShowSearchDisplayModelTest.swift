//
//  ShowSearchDisplayModelTest.swift
//  GetMyShowsTests
//
//  Created by user220159 on 4/27/22.
//

import XCTest
@testable import GetMyShows

class ShowSearchDisplayModelTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSearchDisplayModel() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        
        let displayShow = DisplayShows(name: "ShowA", url: "https://testableurl.com/showa", genere: ["Comedy","Horror"], language: "French")
        
        XCTAssertEqual(displayShow.genere, ["Comedy","Horror"])
        XCTAssertEqual(displayShow.name, "ShowA")
        XCTAssertEqual(displayShow.url, "https://testableurl.com/showa")
        
    }

}
