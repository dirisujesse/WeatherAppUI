//
//  WeatherMetricModel.swift
//  WeatherApp
//
//  Created by Dirisu on 02/05/2023.
//

import Foundation

struct WeatherMetricModel: Identifiable {
    var id = UUID()
    let image: String
    let title: String
    let value: String
}

extension WeatherMetricModel {
    static var mockData: [WeatherMetricModel] {
        return [
            WeatherMetricModel(image: "rainfall", title: "Rainfall", value: "3cm"),
            WeatherMetricModel(image: "wind_speed", title: "Wind", value: "19km/h"),
            WeatherMetricModel(image: "humidity", title: "Humidity", value: "63%"),
        ]
    }
    
    static var forecastData: [WeatherMetricModel] {
        return [
            WeatherMetricModel(image: "sunny_cloudy", title: "Sunday", value: "20°"),
            WeatherMetricModel(image: "sunny", title: "Monday", value: "21°"),
            WeatherMetricModel(image: "sunny", title: "Tuesday", value: "24°"),
            WeatherMetricModel(image: "sunny_cloudy", title: "Wednesday", value: "18°"),
            WeatherMetricModel(image: "cloudy", title: "Thursday", value: "12°"),
            WeatherMetricModel(image: "rainy", title: "Friday", value: "16°"),
            WeatherMetricModel(image: "rainy", title: "Saturday", value: "18°"),
            
        ]
    }
}
