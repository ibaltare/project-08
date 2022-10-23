//
//  MainViewModelTest.swift
//  PracticaTests
//
//  Created by Nicolas on 22/10/22.
//

import XCTest
import Combine
@testable import Practica

final class MainViewModelTest: XCTestCase {

    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCancelSuscriptor() throws {
        var dato = 0
        let publisher = CurrentValueSubject<Int, Never>(dato)
        var suscriptor = Set<AnyCancellable>()
        
        publisher.sink { _ in } receiveValue: { data in
            dato = data
        }
        .store(in: &suscriptor)
        publisher.send(1)
        MainViewModel.cancel(suscriptor: &suscriptor)
        publisher.send(2)
        XCTAssertEqual(dato, 1)
    }

}
