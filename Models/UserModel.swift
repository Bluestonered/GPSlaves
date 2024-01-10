//
//  UserModel.swift
//  GPSlaves
//
//  Created by foulon hugo on 11/12/2023.
//

import Foundation

struct UserModel: Codable, Hashable {
    let firstName, lastName, bio, company: String
    let picture: URL
}
