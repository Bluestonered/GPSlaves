//
//  MapViewModel.swift
//  GPSlaves
//
//  Created by foulon hugo on 11/12/2023.
//

import Foundation
import CoreLocation



enum StateMapViewModel{
    case notAvailable
    case loading
    case success(data: [MapMeetingSpotModel])
    case failed(error: Error)
}

class MapViewModel: ObservableObject {
    
    private let service: MeetingSpotService
    
    @Published var state: StateMapViewModel = .notAvailable
    @Published var hasError: Bool = false
    
    init(service: MeetingSpotService) {
        self.service = service
    }
    
    func getInfo() async {
        self.state = .loading
        self.hasError = false
        do {
            let queryInfo = try await service.fetchSpot()
            
            var mapMeetingSpotArray: [MapMeetingSpotModel] = []
            
            queryInfo.results.forEach {meetingSpot in
                print(meetingSpot)
                let coord = CLLocationCoordinate2D(latitude: meetingSpot.latitude, longitude: meetingSpot.longitude)
                mapMeetingSpotArray.append(MapMeetingSpotModel(name: meetingSpot.name, picture: meetingSpot.image_path, coord: coord))
            }
            
            self.state = .success(data: mapMeetingSpotArray)
        }
        catch {
            self.state = .failed(error: error)
            self.hasError = true
            print(error)
        }
    }
    
    
}
