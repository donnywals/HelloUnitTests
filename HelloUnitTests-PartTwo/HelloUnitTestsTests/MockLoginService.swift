//
//  MockLoginService.swift
//  HelloUnitTestsTests
//
//  Created by Wals, Donny on 23/09/2019.
//  Copyright © 2019 Wals, Donny. All rights reserved.
//

import Foundation
@testable import HelloUnitTests

class MockLoginService: LoginService {
  var result: Result<User, LoginError>?

  func login(_ completion: @escaping (Result<User, LoginError>) -> Void) {
    if let result = result {
      completion(result)
    }
  }
}
