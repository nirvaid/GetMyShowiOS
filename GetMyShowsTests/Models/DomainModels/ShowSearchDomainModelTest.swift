//
//  ShowSearchDomainModelTest.swift
//  GetMyShowsTests
//
//  Created by user220159 on 4/27/22.
//

import XCTest
@testable import GetMyShows

class ShowSearchDomainModelTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testShowSearchDomainModel() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        
        // Convert TestCharacters.json to Data
        let bundle = Bundle(for: type(of: self))
        let path = bundle.path(forResource: "showData", ofType: "json") ?? ""
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped) else {
            fatalError("Data is nil")
        }

        // Provide the Codable struct
        let resource = try? JSONDecoder().decode([Shows].self, from: data)

        guard let sampleShow = resource?.last else {
            fatalError("Data is not correct")
        }

                
        XCTAssertEqual(sampleShow.show.name, "Oh! Mother")
                
        }
}
