//
//  ContentView.swift
//  GPSlaves
//
//  Created by foulon hugo on 11/12/2023.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 36.169941, longitude: -115.139830), span: MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3))
    
    @StateObject var mapViewModel = MapViewModel(service: MeetingSpotService())

    
    
    var body: some View {
        switch mapViewModel.state{
        case .notAvailable:
            EmptyView().task {
                await mapViewModel.getInfo()
            }
        case .loading:
            ProgressView()
        case .failed(error: let error):
            VStack{
                Text("fu")
                
            }
            
            
        case .success(let data):
            
            ZStack{
                Map(coordinateRegion: $region, annotationItems: data) { mapMeetingSpot in
                    MapAnnotation(coordinate: mapMeetingSpot.coord) {
                        Text(mapMeetingSpot.name)
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
