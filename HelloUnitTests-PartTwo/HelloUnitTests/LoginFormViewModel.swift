//
//  LoginFormViewModel.swift
//  HelloUnitTests
//
//  Created by Wals, Donny on 23/09/2019.
//  Copyright © 2019 Wals, Donny. All rights reserved.
//

import Foundation

protocol LoginService {
  func login(_ completion: @escaping (Result<User, LoginError>) -> Void)
}

struct User {

}

enum LoginError: Error {
  case formIsEmpty, usernameIsEmpty, passwordIsEmpty, emailIsInvalid, incorrectCredentials
}

struct LoginFormViewModel {
  var username: String?
  var password: String?

  let loginService: LoginService

  func login(_ completion: @escaping (Result<User, LoginError>) -> Void) {
    guard let password = password, let username = username else {
      if self.username == nil && self.password == nil {
        completion(Result.failure(LoginError.formIsEmpty))
      } else if self.username == nil {
        completion(Result.failure(LoginError.usernameIsEmpty))
      } else {
        completion(Result.failure(LoginError.passwordIsEmpty))
      }
      return
    }

    guard username.contains("@") else {
      completion(Result.failure(LoginError.emailIsInvalid))
      return
    }

    loginService.login(completion)
  }
}
