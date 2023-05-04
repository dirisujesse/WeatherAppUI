//
//  ForecastMetricColumn.swift
//  WeatherApp
//
//  Created by Dirisu on 04/05/2023.
//

import SwiftUI

struct ForecastMetricColumn: View {
    let data: WeatherMetricModel

    var body: some View {
        VStack {
            Image(data.image)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: 50, maxHeight: 50)
                .padding(.bottom, 8)
            Text(data.value)
                .semiBoldFont(size: 14)
        }
        .padding(.bottom, 30)
    }
}

struct ForecastMetricColumn_Previews: PreviewProvider {
    static var previews: some View {
        ForecastMetricColumn(data: WeatherMetricModel.mockData[0])
            .orangeBackgound()
    }
}
