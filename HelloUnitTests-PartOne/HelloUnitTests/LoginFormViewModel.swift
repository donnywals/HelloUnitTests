//
//  LoginFormViewModel.swift
//  HelloUnitTests
//
//  Created by Wals, Donny on 23/09/2019.
//  Copyright © 2019 Wals, Donny. All rights reserved.
//

import Foundation

enum LoginError: Error {
  case formIsEmpty, usernameIsEmpty, passwordIsEmpty, emailIsInvalid
}

struct LoginFormViewModel {
  var username: String?
  var password: String?

  func login() throws {
    guard let password = password, let username = username else {
      if self.username == nil && self.password == nil {
        throw LoginError.formIsEmpty
      } else if self.username == nil {
        throw LoginError.usernameIsEmpty
      } else {
        throw LoginError.passwordIsEmpty
      }
    }

    guard username.contains("@") else {
      throw LoginError.emailIsInvalid
    }
  }
}
