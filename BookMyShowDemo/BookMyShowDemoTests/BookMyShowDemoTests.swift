//
//  BookMyShowDemoTests.swift
//  BookMyShowDemoTests
//
//  Created by Neosoft on 08/01/23.
//

import XCTest
@testable import BookMyShowDemo

final class BookMyShowDemoTests: XCTestCase {
    
    func test_apiResource_with_validRequest_return_apiResponse() {
        let service = ServiceAPI()
        
        let expectation = self.expectation(description: "validRequest_return_apiResponse")
        
        service.getMatchDetails(apiMethod: .getStudentData) { ressponse in
            switch ressponse {
            case .success(let data):
                XCTAssertNotNil(data)
                XCTAssertTrue(data.count > 0)
            case .failure(let error):
                XCTAssertNil(error)
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5)
    }
}
