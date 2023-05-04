//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Dirisu on 02/05/2023.
//

import SwiftUI

@main
struct WeatherAppApp: App {
    @StateObject private var weatherDetailsVm = WeatherDetailsViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(weatherDetailsVm)
        }
    }
}
