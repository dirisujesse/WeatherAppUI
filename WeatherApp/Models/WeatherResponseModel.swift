// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let weatherResponseModel = try? JSONDecoder().decode(WeatherResponseModel.self, from: jsonData)

import Foundation

class WeatherResponseModel: Codable {
    let location: Location
    let current: Current
    let forecast: Forecast

    init(location: Location, current: Current, forecast: Forecast) {
        self.location = location
        self.current = current
        self.forecast = forecast
    }
}

class Current: Codable {
    let lastUpdatedEpoch: Int
    let lastUpdated: String
    let tempC: Double
    let tempF: Double
    let condition: Condition
    let windMph, windKph, humidity: Double
    let precipMm, precipIn: Double
    let feelslikeC, visKM: Double

    enum CodingKeys: String, CodingKey {
        case lastUpdatedEpoch = "last_updated_epoch"
        case lastUpdated = "last_updated"
        case tempC = "temp_c"
        case tempF = "temp_f"
        case condition
        case windMph = "wind_mph"
        case windKph = "wind_kph"
        case precipMm = "precip_mm"
        case precipIn = "precip_in"
        case humidity
        case feelslikeC = "feelslike_c"
        case visKM = "vis_km"
    }

    init(lastUpdatedEpoch: Int, lastUpdated: String, tempC: Double, tempF: Double, condition: Condition, windMph: Double,
         windKph: Double, precipMm: Double, precipIn: Double, humidity: Double, feelslikeC: Double, visKM: Double
    ) {
        self.lastUpdatedEpoch = lastUpdatedEpoch
        self.lastUpdated = lastUpdated
        self.tempC = tempC
        self.tempF = tempF
        self.condition = condition
        self.windMph = windMph
        self.windKph = windKph
        self.precipMm = precipMm
        self.precipIn = precipIn
        self.humidity = humidity
        self.feelslikeC = feelslikeC
        self.visKM = visKM
    }
}

class Condition: Codable {
    let text, icon: String
    let code: Int

    init(text: String, icon: String, code: Int) {
        self.text = text
        self.icon = icon
        self.code = code
    }
    
    var image: String {
        let normalisedText = text.lowercased()
        if (normalisedText.contains("rain")) {
            return "rainy";
        }
        if (normalisedText.contains("partly cloudy")) {
            return "sunny_cloudy"
        }
        if (normalisedText.contains("cloud")) {
            return "cloudy"
        }
        return "sunny"
    }
}

class Forecast: Codable {
    let forecastday: [Forecastday]

    init(forecastday: [Forecastday]) {
        self.forecastday = forecastday
    }
}

class Forecastday: Codable {
    let date: String
    let dateEpoch: Int
    let day: Day
    let hour: [Hour]

    enum CodingKeys: String, CodingKey {
        case date
        case dateEpoch = "date_epoch"
        case day, hour
    }

    init(date: String, dateEpoch: Int, day: Day, hour: [Hour]) {
        self.date = date
        self.dateEpoch = dateEpoch
        self.day = day
        self.hour = hour
    }
}

class Day: Codable {
    let maxtempC, maxtempF, mintempC, mintempF: Double
    let avgtempC, avgtempF, maxwindMph, maxwindKph: Double
    let totalprecipMm, totalprecipIn: Double
    let totalsnowCM: Double
    let avgvisKM, avgvisMiles, avghumidity: Double
    let condition: Condition

    enum CodingKeys: String, CodingKey {
        case maxtempC = "maxtemp_c"
        case maxtempF = "maxtemp_f"
        case mintempC = "mintemp_c"
        case mintempF = "mintemp_f"
        case avgtempC = "avgtemp_c"
        case avgtempF = "avgtemp_f"
        case maxwindMph = "maxwind_mph"
        case maxwindKph = "maxwind_kph"
        case totalprecipMm = "totalprecip_mm"
        case totalprecipIn = "totalprecip_in"
        case totalsnowCM = "totalsnow_cm"
        case avgvisKM = "avgvis_km"
        case avgvisMiles = "avgvis_miles"
        case avghumidity
        case condition
    }

    init(maxtempC: Double, maxtempF: Double, mintempC: Double, mintempF: Double, avgtempC: Double, avgtempF: Double,
         maxwindMph: Double, maxwindKph: Double, totalprecipMm: Double, totalprecipIn: Double, totalsnowCM: Double,
         avgvisKM: Double, avgvisMiles: Double, avghumidity: Double, condition: Condition) {
        self.maxtempC = maxtempC
        self.maxtempF = maxtempF
        self.mintempC = mintempC
        self.mintempF = mintempF
        self.avgtempC = avgtempC
        self.avgtempF = avgtempF
        self.maxwindMph = maxwindMph
        self.maxwindKph = maxwindKph
        self.totalprecipMm = totalprecipMm
        self.totalprecipIn = totalprecipIn
        self.totalsnowCM = totalsnowCM
        self.avgvisKM = avgvisKM
        self.avgvisMiles = avgvisMiles
        self.avghumidity = avghumidity
        self.condition = condition
    }
}

class Hour: Codable {
    let timeEpoch: Int
    let time: String
    let tempC, tempF: Double
    let condition: Condition
    let windMph, windKph: Double
    let precipMm, precipIn: Double
    let humidity: Double
    let feelslikeC, feelslikeF: Double
    let visKM, visMiles: Double

    enum CodingKeys: String, CodingKey {
        case timeEpoch = "time_epoch"
        case time
        case tempC = "temp_c"
        case tempF = "temp_f"
        case condition
        case windMph = "wind_mph"
        case windKph = "wind_kph"
        case precipMm = "precip_mm"
        case precipIn = "precip_in"
        case humidity
        case feelslikeC = "feelslike_c"
        case feelslikeF = "feelslike_f"
        case visKM = "vis_km"
        case visMiles = "vis_miles"
    }

    init(timeEpoch: Int, time: String, tempC: Double, tempF: Double, condition: Condition,windMph: Double, windKph: Double, precipMm: Double,
         precipIn: Double, humidity: Double, cloud: Int, feelslikeC: Double, feelslikeF: Double, visKM: Double, visMiles: Double) {
        self.timeEpoch = timeEpoch
        self.time = time
        self.tempC = tempC
        self.tempF = tempF
        self.condition = condition
        self.windMph = windMph
        self.windKph = windKph
        self.precipMm = precipMm
        self.precipIn = precipIn
        self.humidity = humidity
        self.feelslikeC = feelslikeC
        self.feelslikeF = feelslikeF
        self.visKM = visKM
        self.visMiles = visMiles
    }
}

class Location: Codable {
    let name, region, country: String
    let lat, lon: Double
    let tzID: String
    let localtimeEpoch: Int
    let localtime: String

    enum CodingKeys: String, CodingKey {
        case name, region, country, lat, lon
        case tzID = "tz_id"
        case localtimeEpoch = "localtime_epoch"
        case localtime
    }

    init(name: String, region: String, country: String, lat: Double, lon: Double, tzID: String, localtimeEpoch: Int, localtime: String) {
        self.name = name
        self.region = region
        self.country = country
        self.lat = lat
        self.lon = lon
        self.tzID = tzID
        self.localtimeEpoch = localtimeEpoch
        self.localtime = localtime
    }
}
