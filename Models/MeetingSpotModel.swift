//
//  MeetingSpotModel.swift
//  GPSlaves
//
//  Created by foulon hugo on 11/12/2023.
//

import Foundation

struct QueryInfo: Codable {
    let resultCount: Int
    let results: [MeetingSpotModel]
}

struct MeetingSpotModel: Codable, Hashable {
    let name: String
    let picture: URL
    let latitude: Double
    let longitude: Double
}

