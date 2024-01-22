//
//  MeetingSpotModel.swift
//  GPSlaves
//
//  Created by foulon hugo on 11/12/2023.
//

import Foundation
import CoreLocation

struct QueryInfo: Codable {
    let resultCount: Int
    let results: [ApiMeetingSpotModel]
}

struct ApiMeetingSpotModel: Codable, Hashable {
    let id: Int
    let name: String
    let image_path: URL
    let latitude: Double
    let longitude: Double
    //let coord : CLLocationCoordinate2D?
}

struct MapMeetingSpotModel : Identifiable{
    let id = UUID()
    let name: String
    let picture: URL
    let coord : CLLocationCoordinate2D
}
