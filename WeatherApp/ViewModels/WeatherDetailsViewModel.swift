//
//  WeatherDetailsViewModel.swift
//  WeatherApp
//
//  Created by Dirisu on 04/05/2023.
//

import CoreLocation
import Foundation

enum ViewState: Equatable {
    case busy
    case idle
    case error
}

@MainActor
class WeatherDetailsViewModel: ObservableObject {
    let locationService = AppLocationService()
    let apiService = AppHttpService()

    @Published var currentWeather: WeatherResponseModel? = nil
    @Published var state: ViewState = ViewState.idle
    @Published var errorMessage: String? = nil

    var current: CurrentWeatherViewModel {
        CurrentWeatherViewModel(currentWeather: currentWeather?.current, forecast: currentWeather?.forecast)
    }

    var currentCountry: String {
        currentWeather?.location.country ?? "Nigeria"
    }

    var currentCity: String {
        currentWeather?.location.name ?? "Lagos"
    }

    var isBusy: Bool {
        state == .busy
    }

    var hasError: Bool {
        state == .error
    }
    
    
    var hasData: Bool {
        currentWeather != nil
    }

    var currentTime: String {
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "EEE, MMM dd"

        return dateFormatter.string(from: Date())
    }

    private func resetData() {
        errorMessage = nil
        currentWeather = nil
    }

    func getCurrentLocationWeather(force: Bool = false) async {
        if (currentWeather != nil && !force) {
            return;
        }
        do {
            state = .busy
            resetData()
            guard let location = try await locationService.getCurrentLocation() else {
                fatalError("Location could not be retrieved, we need access to your current location to function")
            }
            await getWeatherForLocation(location: location)
            state = .idle
        } catch {
            state = .error
            errorMessage = "An unexpeted error occured while fetching your location weather"
        }
    }

    func getWeatherForLocation(location: CLLocation) async {
        guard let weather = try? await apiService.getLocationWeather(location: location) else {
            state = .error
            errorMessage = "We couldn't fetch weather for your current location please try again"
            return
        }
        currentWeather = weather
    }

    func getWeatherForLocation(address location: String) async {
        if let placeMark = try? await locationService.getLocationName(address: location), let coreLocation = placeMark.location {
            guard let weather = try? await apiService.getLocationWeather(location: coreLocation) else {
                state = .error
                errorMessage = "We couldn't fetch weather for your current location please try again"
                return
            }
            currentWeather = weather
        } else {
            state = .error
            errorMessage = "Invalid address, we could not find weather data for \(location)"
        }
    }
}

struct CurrentWeatherViewModel {
    let temp: Int
    let humidity: Double
    let rainfall: Double
    let windSpeed: Double
    let hourlyForecast: [WeatherHourlyForcast]
    let dailyForecast: [WeatherDailyForcast]
    let image: String

    init(currentWeather: Current?, forecast: Forecast?) {
        temp = Int(currentWeather?.tempC ?? 0)
        humidity = currentWeather?.humidity ?? 0
        rainfall = currentWeather?.precipMm ?? 0
        windSpeed = currentWeather?.windKph ?? 0
        hourlyForecast = forecast?.forecastday.first?.hour.map(WeatherHourlyForcast.init) ?? []
        dailyForecast = forecast?.forecastday.map(WeatherDailyForcast.init) ?? []
        image = currentWeather?.condition.image ?? ""
    }

    var formattedTemp: String {
        return "\(temp)"
    }

    var formattedHumidity: String {
        let normalisedHumidity = String(format: "%.0f", humidity)
        return "\(normalisedHumidity)%"
    }

    var formattedWindSpeed: String {
        let normalisedSpeed = String(format: "%.0f", windSpeed)
        return "\(normalisedSpeed)km/h"
    }

    var formattedRainfall: String {
        let normalisedRainfall = String(format: "%.1f", rainfall)
        return "\(normalisedRainfall)mm"
    }

    var metricsList: [WeatherMetricModel] {
        [
            WeatherMetricModel(image: "rainfall", title: "Rainfall", value: formattedRainfall),
            WeatherMetricModel(image: "wind_speed", title: "Wind", value: formattedWindSpeed),
            WeatherMetricModel(image: "humidity", title: "Humidity", value: formattedHumidity),
        ]
    }
}

struct WeatherHourlyForcast: Identifiable {
    var id = UUID()
    let time: Int64
    let temp: Int
    let image: String

    init(_ forecast: Hour?) {
        temp = Int(forecast?.tempC ?? 0)
        time = Int64(forecast?.timeEpoch ?? 0)
        image = forecast?.condition.image ?? "sunny"
    }

    var formattedTemp: String {
        return "\(temp)"
    }

    var formattedTime: String {
        let date = Date(timeIntervalSince1970: TimeInterval(time))
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "HH:mm"

        return dateFormatter.string(from: date)
    }
}

struct WeatherDailyForcast: Identifiable {
    var id = UUID()
    let time: Int64
    let temp: Int
    let image: String

    init(_ forecast: Forecastday?) {
        temp = Int(forecast?.day.avgtempC ?? 0)
        time = Int64(forecast?.dateEpoch ?? 0)
        image = forecast?.day.condition.image ?? "sunny"
    }

    var formattedTemp: String {
        return "\(temp)°"
    }

    var formattedDate: String {
        let date = Date(timeIntervalSince1970: TimeInterval(time))
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "EEEE"

        return dateFormatter.string(from: date)
    }
}
