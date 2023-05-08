//
//  TempratureForecastPill.swift
//  WeatherApp
//
//  Created by Dirisu on 02/05/2023.
//

import SwiftUI

struct TempratureForecastPill: View {
    let forecast: WeatherHourlyForcast;
    
    var body: some View {
        VStack {
            Text(forecast.formattedTime)
                .regularFont(size: 14, color: .secondaryText)
            Image(forecast.image)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: vw(10), maxHeight: vw(10))
            InlineTempratureText(degrees: forecast.formattedTemp)
        }
        .padding()
        .background(.primary30)
        .clipShape(RoundedRectangle(cornerRadius: 50))
    }
}
