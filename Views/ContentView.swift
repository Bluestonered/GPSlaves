//
//  ContentView.swift
//  GPSlaves
//
//  Created by foulon hugo on 11/12/2023.
//

import SwiftUI
import MapKit

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct ContentView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 36.169941, longitude: -115.139830), span: MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3))
    
    @StateObject var mapViewModel = MapViewModel(service: MeetingSpotService())

    
    
    var body: some View {
        switch mapViewModel.state{
            case .notAvailable:
                EmptyView()
            case .loading:
                ProgressView()
            case .success(let data):
                var locations = [
                    Location(name: "Buckingham Palace", coordinate: CLLocationCoordinate2D(latitude: 51.501, longitude: -0.141)),
                    Location(name: "Tower of London", coordinate: CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076))
                ]
            
                ForEach(data.results, id: \.self){ meetingSpot in
                    locations.append(Location(name: meetingSpot.name, coordinate: CLLocationCoordinate2D(latitude: meetingSpot.latitude, longitude: meetingSpot.longitude)))
                }
                ZStack{
                    Map(coordinateRegion: $region, annotationItems: locations) { location in
                        MapAnnotation(coordinate: location.coordinate) {
                        }
                    }
                    .navigationTitle("Map")
                    .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                                
                                Spacer()
                        
                                Button(action: {
                                    // Handle button tap here
                                }) {
                                    Text("Tap me!")
                                        .padding(6)
                                        .background(Color.blue)
                                        .foregroundColor(.white)
                                        .cornerRadius(10)
                                }
                        .position(x: 350)
                    }
                }
                
        }


    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
