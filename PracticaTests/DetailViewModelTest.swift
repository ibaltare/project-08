//
//  DetailViewModelTest.swift
//  PracticaTests
//
//  Created by Nicolas on 22/10/22.
//

import XCTest
import Combine
@testable import Practica

final class DetailViewModelTest: XCTestCase {
    //System under testing
    var sut: DetailViewModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    @MainActor func testLoadComicsSuccess() throws {
        let expectation = expectation(description: "Load comics finalized")
        var subscriber = Set<AnyCancellable>()
        var success = false
        
        sut = DetailViewModel(characterID: 1009175)
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
