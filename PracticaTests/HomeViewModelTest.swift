//
//  HomeViewModelTest.swift
//  PracticaTests
//
//  Created by Nicolas on 22/10/22.
//

import XCTest
import Combine
@testable import Practica

final class HomeViewModelTest: XCTestCase {
    //System under testing
    var sut: HomeViewModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testLoadCharacters() throws {
        let expectation = expectation(description: "Load characters finalized")
        var subscriber = Set<AnyCancellable>()
        var success = false
        
        sut = HomeViewModel()
        XCTAssertNotNil(sut)
        
        sut.$status.sink { completion in
            if completion == .loaded {
                success = true
                expectation.fulfill()
            }
        }
        .store(in: &subscriber)
        waitForExpectations(timeout: 10)
        XCTAssertTrue(success)
    }

}
