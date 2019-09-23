//
//  HelloUnitTestsTests.swift
//  HelloUnitTestsTests
//
//  Created by Wals, Donny on 23/09/2019.
//  Copyright © 2019 Wals, Donny. All rights reserved.
//

import XCTest
@testable import HelloUnitTests

class HelloUnitTestsTests: XCTestCase {

  var loginFormViewModel: LoginFormViewModel!

  override func setUp() {
    loginFormViewModel = LoginFormViewModel()
  }
  
  func testEmptyLoginFormThrowsError() {
    XCTAssertNil(loginFormViewModel.username)
    XCTAssertNil(loginFormViewModel.password)
    XCTAssertThrowsError(try loginFormViewModel.login()) { error in
      guard case LoginError.formIsEmpty = error else {
        XCTFail("Expected the thrown error to be formIsEmpty")
        return
      }
    }
  }

  func testEmptyUsernameThrowsError() {
    loginFormViewModel.password = "password"
    XCTAssertNil(loginFormViewModel.username)
    XCTAssertNotNil(loginFormViewModel.password)
    XCTAssertThrowsError(try loginFormViewModel.login()) { error in
      guard case LoginError.usernameIsEmpty = error else {
        XCTFail("Expected the thrown error to be usernameIsEmpty")
        return
      }
    }
  }

  func testEmptyPasswordThrowsError() {
    loginFormViewModel.username = "username"
    XCTAssertNil(loginFormViewModel.password)
    XCTAssertNotNil(loginFormViewModel.username)
    XCTAssertThrowsError(try loginFormViewModel.login()) { error in
      guard case LoginError.passwordIsEmpty = error else {
        XCTFail("Expected the thrown error to be passwordIsEmpty")
        return
      }
    }
  }

  func testInvalidEmailThrowsError() {
    loginFormViewModel.username = "username"
    loginFormViewModel.password = "password"
    XCTAssertNotNil(loginFormViewModel.username)
    XCTAssertNotNil(loginFormViewModel.password)
    XCTAssertThrowsError(try loginFormViewModel.login()) { error in
      guard case LoginError.emailIsInvalid = error else {
        XCTFail("Expected the thrown error to be emailIsInvalid")
        return
      }
    }
  }
}
