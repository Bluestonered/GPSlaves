//
//  MapViewModel.swift
//  GPSlaves
//
//  Created by foulon hugo on 11/12/2023.
//

import Foundation

enum StateMapViewModel{
    case notAvailable
    case loading
    case success(data: QueryInfo)
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
            self.state = .success(data: queryInfo)
        }
        catch {
            self.state = .failed(error: error)
            self.hasError = true
            print(error)
        }
    }
    
    func 
}
