//
//  SpotService.swift
//  GPSlaves
//
//  Created by foulon hugo on 08/01/2024.
//

import Foundation

enum MeetingSpotError: Error {
    case failed
    case failedToDecode
    case invalidStatusCode
}

struct MeetingSpotService{
    
    func fetchSpot() async throws -> QueryInfo {
            
        let url = URL(string: "https://ios.allbyte.fr/meeting_spot/")!
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw MeetingSpotError.invalidStatusCode
        }
        
        print(data)
        
        let decodedData = try JSONDecoder().decode(QueryInfo.self,from: data)
        return decodedData
    }
}
