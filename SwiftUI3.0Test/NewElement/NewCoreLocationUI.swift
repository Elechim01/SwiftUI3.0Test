//
//  NewCoreLocationUI.swift
//  SwiftUI3.0Test
//
//  Created by Michele Manniello on 12/06/21.
// New Core Location Button For Location Access..

import SwiftUI
import CoreLocationUI
import CoreLocation
import MapKit

@available(iOS 15.0, *)
struct NewCoreLocationUI: View {
//    Create State Object..
    @StateObject var locationManager = LocationManager()
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
//                Map...
            Map(coordinateRegion: $locationManager.region,showsUserLocation: true,annotationItems: locationManager.coffeeShops,annotationContent: { shop in
                MapMarker(coordinate: shop.mapItem.placemark.coordinate, tint: .purple)
            })
                .ignoresSafeArea()
            
            
            
            LocationButton(.currentLocation) {
                locationManager.manager.requestLocation()
            }
            .frame(width: 210, height: 50)
            .symbolVariant(.fill)
            .foregroundColor(.white)
            .tint(.purple)
            .clipShape(Capsule())
            .padding()
        }
//        Material Top Header...
        .overlay(
            Text("Coffee Shop's")
                .font(.title.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(.ultraThinMaterial)
            ,alignment: .top
        )
//        Basically in swiftUi 3.0 overlay or backgorund
//        will automatically fill safe area also...
        
            
    }
}

@available(iOS 15.0, *)
struct NewCoreLocationUI_Previews: PreviewProvider {
    static var previews: some View {
        NewCoreLocationUI()
    }
}

//Location Manager...
@available(iOS 15.0, *)
class LocationManager: NSObject,ObservableObject,CLLocationManagerDelegate{
    @Published var manager = CLLocationManager()
//    region
    @Published var region: MKCoordinateRegion = .init()
    @Published var coffeeShops: [Shop] = []
    
//    Setting Delegate..
    override init() {
        super.init()
        manager.delegate = self
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
//        Do some thing here...
        
        print(error.localizedDescription)
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last?.coordinate else{
            return
        }
        print(location)
        region = MKCoordinateRegion(center: location, latitudinalMeters: 1000, longitudinalMeters: 1000)
//        calling Tasks.....
        async{
            await fetchCoffeShops()
        }
    }
//    Sample Location Search Aync Task...
    func fetchCoffeShops()async{
        do{
            let request = MKLocalSearch.Request()
            request.region = region
            request.naturalLanguageQuery = "Coffee Shops"
            
            let query = MKLocalSearch(request: request)
            let response = try await query.start()
//            Mappign Map items..
            
//            You can also use Dispatch Queue...
           await MainActor.run {
                self.coffeeShops = response.mapItems.compactMap { item in
                    return Shop(mapItem: item)
                }
            }
            
            
            
        }catch{
//            Do some thing here...
            
        }
    }
}
//Sample Model for Map Pins...
struct Shop: Identifiable{
    var id = UUID().uuidString
    var mapItem: MKMapItem
}
