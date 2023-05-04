//
//  AppHttpService.swift
//  WeatherApp
//
//  Created by Dirisu on 04/05/2023.
//

import Foundation
import CoreLocation

enum NetworkError: Error {
    case badUrl;
    case badRequest;
    case unexpectedError;
}

class AppHttpService {
    func getLocationWeather(location: CLLocation) async throws -> WeatherResponseModel? {
        guard let url = URL(string: "\(AppConstants.baseUrl)&q=\(location.coordinate.latitude),\(location.coordinate.longitude)&days=7") else {
            throw NetworkError.badUrl
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let object =  try? JSONDecoder().decode(WeatherResponseModel.self, from: data)
        return object;
    }
}
