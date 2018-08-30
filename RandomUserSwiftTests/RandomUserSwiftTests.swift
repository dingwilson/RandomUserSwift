//
//  RandomUserSwiftTests.swift
//  RandomUserSwiftTests
//
//  Created by Wilson Ding on 10/10/16.
//  Copyright © 2016 Wilson Ding. All rights reserved.
//

import XCTest
@testable import RandomUserSwift

class RandomUserSwiftTests: XCTestCase {

    var data: Users?
    var error: Error?

    var expectation: XCTestExpectation?

    override func setUp() {
        super.setUp()

        self.error = nil
        self.data = nil
        self.expectation = self.expectation(description: "api")
    }

    override func tearDown() {
        XCTAssertNil(self.error, "Running getUsers returns non-nil error.")
        XCTAssertNotNil(self.data, "Running getUsers returns nil value for data.")

        self.expectation = nil
        super.tearDown()
    }

    func testGetUsersWithMultipleResults() {
        RandomUser.shared.getUsers(results: 5) {
            self.data = $0
            self.error = $1

            self.expectation?.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)

        XCTAssertEqual(data?.results?.count,
                       5,
                       "Setting multiple results does not generate correct number of users.")
    }

    func testGetUsersByFemaleGender() {
        RandomUser.shared.getUsers(gender: "female") {
            self.data = $0
            self.error = $1

            self.expectation?.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)

        XCTAssertEqual(data?.results?[0].gender?.rawValue,
                       "female",
                       "Setting gender as female does not generate a female user.")
    }

    func testGetUsersByMaleGender() {
        RandomUser.shared.getUsers(gender: "male") {
            self.data = $0
            self.error = $1

            self.expectation?.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)

        XCTAssertEqual(data?.results?[0].gender?.rawValue,
                       "male",
                       "Setting gender as male does not generate a male user.")
    }

    func testGetUsersByNationality() {
        RandomUser.shared.getUsers(nationality: "us") {
            self.data = $0
            self.error = $1

            self.expectation?.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)

        XCTAssertEqual(data?.results?[0].nat,
                       "US",
                       "Setting nationality as US does not generate a user with US nat.")
    }
}
