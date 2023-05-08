//
//  HomeLocationHeader.swift
//  WeatherApp
//
//  Created by Dirisu on 04/05/2023.
//

import SwiftUI

struct HomeLocationHeader: View {
    struct LocationData {
        let city: String
        let country: String
        let time: String
    }
    
    let data: LocationData
    
    init(city: String, country: String, time: String) {
        self.data = LocationData(city: city, country: country, time: time)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(data.city),\n\(data.country)")
                .mediumFont(size: 40)
            Text(data.time)
                .regularFont(size: 16, color: .secondaryText)
        }
    }
}

struct HomeLocationHeader_Previews: PreviewProvider {
    static var previews: some View {
        HomeLocationHeader(city: "Lagos", country: "Nigieria", time: "Tue, Apr 30")
            .orangeBackgound()
    }
}
