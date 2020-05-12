//
//  Quotes.swift
//  HealthSense
//
//  Created by Sensehack on 5/10/20.
//  Copyright © 2020 Sensehack. All rights reserved.
//

import Foundation

struct Quotes2 {
    let idI: Int
    let quote: String
    let author: String
}

/*
{"_id":"5a95d55e7700780004d51dc3","sr":"","en":"The next best thing to having good ideas is recognizing good ideas from your users.",
 "author":"Eric S. Raymond","source":"","numberOfVotes":1,"rating":4,"addedBy":"5ab04d928c8b4e3cbf733557","id":"5a95d55e7700780004d51dc3"}
*/

// swiftlint:disable identifier_name
struct Quotes: Decodable {
    let id, sr, en, author: String?
    let source: String?
    let numberOfVotes: Int?
    let rating: Double?
    let addedBy, welcomeID: String?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case sr, en, author, source, numberOfVotes, rating, addedBy
        case welcomeID = "id"
    }
}
