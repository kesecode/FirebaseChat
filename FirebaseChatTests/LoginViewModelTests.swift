//
//  LoginViewModelTests.swift
//  FirebaseChatTests
//
//  Created by David Weppler on 01.02.21.
//

import XCTest

@testable import FirebaseChat

class LoginViewModelTests: XCTestCase {
    var viewModel: LoginViewModel!
    var sessionManagerMock: SessionManagerMock!
    
    override func setUp() {
        sessionManagerMock = SessionManagerMock()
        viewModel = .init(sessionManager: sessionManagerMock)
    }
    
    func testSuccessfullLogin() {
        viewModel.login()
        XCTAssert(viewModel.loginError == nil)
    }
    
    func testFailedLogin() {
        sessionManagerMock.loginResult = .failure(FirebaseErrorMock())
        viewModel.login()
        XCTAssert(viewModel.loginError != nil)
    }
}
