//
//  MockSessionManager.swift
//  FirebaseChatTests
//
//  Created by David Weppler on 01.02.21.
//

@testable import FirebaseChat


final class SessionManagerMock: SessionManaging {
    var loginResult: Result<Void, Error> = .success(())
    
    func login(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        completion(loginResult)
    }
}
