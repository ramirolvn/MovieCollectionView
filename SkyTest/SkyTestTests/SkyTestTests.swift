//
//  SkyTestTests.swift
//  SkyTestTests
//
//  Created by Ramiro Lima Vale Neto on 24/05/19.
//  Copyright © 2019 Ramiro Lima Vale Neto. All rights reserved.
//

import XCTest
@testable import SkyTest

class SkyTestTests: XCTestCase {
    private var fakeDataService: FakeDataService!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.fakeDataService = FakeDataService()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSuccessGetMovieSuccess(){
        let getMovieResult = fakeDataService.getFakeMoviesTest(sucess: true)
        XCTAssertEqual(getMovieResult.1, nil)
        XCTAssert(getMovieResult.0?.count == 3)
        XCTAssert(getMovieResult.0?[0].title == "Movie 1")
    }
    
    func testSuccessGetMovieError(){
        let getMovieResult = fakeDataService.getFakeMoviesTest(sucess: false)
        XCTAssert(getMovieResult.1 != nil)
        XCTAssert(getMovieResult.0 == nil)
    }
}
