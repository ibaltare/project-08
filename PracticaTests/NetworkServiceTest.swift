//
//  NetworkServiceTest.swift
//  PracticaTests
//
//  Created by Nicolas on 22/10/22.
//

import XCTest
import Combine
@testable import Practica

final class NetworkServiceTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNetworkSuccess() throws {
        var subscriber = Set<AnyCancellable>()
        let expectation = expectation(description: "Network service test")
        var success = false
        NetworkService.shared.getData(type: CharacterDataWrapper.self, urlRequest: NetworkService.shared.getSessionCharacters())
            .sink { completion in
                switch completion{
                case .failure(_):
                    expectation.fulfill()
                case .finished:
                    success = true
                    expectation.fulfill()
                }
            } receiveValue: { data in
            }
            .store(in: &subscriber)
        
        waitForExpectations(timeout: 10)
        XCTAssertTrue(success)
    }

    func testNetworkBadServerResponse() throws {
        var subscriber = Set<AnyCancellable>()
        let expectation = expectation(description: "Network service test")
        var success = false
        let url = URL(string: MarvelApi.URLCharacters)!
        let request = URLRequest(url: url)
        NetworkService.shared.getData(type: CharacterDataWrapper.self, urlRequest: request)
            .sink { completion in
                switch completion{
                case .failure(_):
                    success = true
                    expectation.fulfill()
                case .finished:
                    expectation.fulfill()
                }
            } receiveValue: { data in
            }
            .store(in: &subscriber)
        
        waitForExpectations(timeout: 10)
        XCTAssertTrue(success)
    }

    func testAsyncBadServerResponse() throws {
        let expectation = expectation(description: "Network service test")
        let url = URL(string: MarvelApi.URLCharacters)!
        let request = URLRequest(url: url)
        Task(priority: .medium) {
            do{
                let result = try await NetworkService.shared.getData(type: ComicDataWrapper.self, urlRequest: request)
                XCTAssertEqual(1,2)
                expectation.fulfill()
            } catch {
                XCTAssertEqual(1,1)
                expectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 10)
    }
}
