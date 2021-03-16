//
//  Message.swift
//  FirebaseChat
//
//  Created by David Weppler on 30.01.21.
//

struct Message {
    var uid: String
    var message: String?

    init(uid: String, message: String) {
        self.uid = uid
        self.message = message
    }
}
