//
//  AppLocationService.swift
//  WeatherApp
//
//  Created by Dirisu on 04/05/2023.
//

import CoreLocation

class AppLocationService : NSObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    private let geoCoder = CLGeocoder()
    
    enum LocationError: Error {
        case disabled
        case denied
        case unknown
    }
    
    override init() {
        super.init()
        locationManager.delegate = self
    }

    private func requestLocationPermission() {
        locationManager.requestAlwaysAuthorization()
    }

    func getCurrentLocation() async throws -> CLLocation? {
        let permissionStatus = locationManager.authorizationStatus

        switch permissionStatus {
        case .notDetermined, .restricted:
            requestLocationPermission()
            return try await getCurrentLocation()
        case .denied:
            throw LocationError.denied
        default:
            guard let location = locationManager.location else {
                throw LocationError.unknown
            }
            return location
        }
    }
    
    func getLocationName(coordinates location: CLLocation) async throws -> CLPlacemark? {
        let placeMarks = try await geoCoder.reverseGeocodeLocation(location)
        
        return placeMarks.first
    }
    
    
    func getLocationName(address location: String) async throws -> CLPlacemark? {
        let placeMarks = try await geoCoder.geocodeAddressString(location)
        
        return placeMarks.first
    }
}
